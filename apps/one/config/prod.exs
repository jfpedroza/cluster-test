use Mix.Config

config :one,
  topologies: [
    one: [
      strategy: Cluster.Strategy.Kubernetes.DNS,
      config: [service: "cluster-nodes", application_name: "one"]
    ],
    two: [
      strategy: Cluster.Strategy.Kubernetes.DNS,
      config: [service: "cluster-nodes", application_name: "two"]
    ],
    three: [
      strategy: Cluster.Strategy.Kubernetes.DNS,
      config: [service: "cluster-nodes", application_name: "three"]
    ]
  ]
