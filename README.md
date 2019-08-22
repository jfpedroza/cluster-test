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

