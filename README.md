# Cluster test

Elixir cluster example locally and on Kubernetes

## Required tools

- [Docker](https://docs.docker.com/install/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)

## Instructions

### Locally

#### Fetch and compile depenencies

```bash
make deps
```

#### Running

```bash
# Open 3 terminals

# On terminal 1
cd apps/one
iex --sname one --cookie hi -S mix run

# On terminal 2
cd apps/two
iex --sname two --cookie hi -S mix run

# On terminal 3
cd apps/three
iex --sname three --cookie hi -S mix phx.server
```

#### Checking the connection

```elixir
# On terminal 1
iex(one@jhon-pc)1> Node.list
[:"two@jhon-pc", :"three@jhon-pc"]

# On terminal 2
iex(two@jhon-pc)1> Node.list
[:"one@jhon-pc", :"three@jhon-pc"]

# On terminal 3
iex(three@jhon-pc)1> Node.list
[:"one@jhon-pc", :"two@jhon-pc"]
```

### On Kubernetes

#### Setting up minikube

```bash
# Enable the registry addon
minikube addons enable registry

# Start the local Kubernetes cluster
minikube start

# Use the minikube docker daemon from the host
eval $(minikube docker-env)

# Get the ip of the registry endpoint
export REGISTRY_IP=$(kubectl -n kube-system get svc registry -o jsonpath="{.spec.clusterIP}")
```

#### Building and running

```bash
# Build and pushing the images
make build push

# Replace the registry IP in the deployment file (I still don't know how to fix this)
sed -i "s/10.102.57.234/$REGISTRY_IP/" deployment.yaml

# Create and run the deployments and services
kubectl create -f deployment.yaml

```

#### Verifying it works

```bash
# The deployments were created
kubectl get deployments

NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
cluster-test-one     0/2     2            0           9s
cluster-test-three   0/2     2            0           9s
cluster-test-two     0/2     2            0           9s

# The pods are running
kubectl get pods

NAME                                  READY   STATUS    RESTARTS   AGE
cluster-test-one-c7c58c955-7m27x      1/1     Running   0          2m13s
cluster-test-one-c7c58c955-wsdjf      1/1     Running   0          2m13s
cluster-test-three-6cc78f569d-grgmt   1/1     Running   0          2m13s
cluster-test-three-6cc78f569d-grls4   1/1     Running   0          2m13s
cluster-test-two-6d4f5ffdcc-jr97p     1/1     Running   0          2m13s
cluster-test-two-6d4f5ffdcc-qkfgs     1/1     Running   0          2m13s

# The services are created
Kubectl get svc

NAME              TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
cluster-nodes     ClusterIP      None            <none>        4369/TCP         7h32m
cluster-test-lb   LoadBalancer   10.110.250.33   <pending>     6000:32020/TCP   7h32m
kubernetes        ClusterIP      10.96.0.1       <none>        443/TCP          8d

```

#### Run the load balancer

```bash
minikube service cluster-test-lb

|-----------|-----------------|-----------------------------|
| NAMESPACE |      NAME       |             URL             |
|-----------|-----------------|-----------------------------|
| default   | cluster-test-lb | http://192.168.99.101:32020 |
|-----------|-----------------|-----------------------------|
  Opening kubernetes service  default/cluster-test-lb in default browser...
```

#### In the browser

```json
{
  "me": "three@172.17.0.10",
  "neighbors": [
    "one@172.17.0.5",
    "two@172.17.0.6",
    "one@172.17.0.9",
    "three@172.17.0.11",
    "two@172.17.0.8"
  ]
}
```
