import Config

config :two,
  topologies: [
    one: [
      strategy: Cluster.Strategy.Kubernetes.DNS,
      config: [service: "cluster-nodes-one", application_name: "one"]
    ],
    two: [
      strategy: Cluster.Strategy.Kubernetes.DNS,
      config: [service: "cluster-nodes-two", application_name: "two"]
    ],
    three: [
      strategy: Cluster.Strategy.Kubernetes.DNS,
      config: [service: "cluster-nodes-three", application_name: "three"]
    ]
  ]
