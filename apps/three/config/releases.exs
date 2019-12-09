import Config

config :three, ThreeWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: "dEUYe/MmwJMD0BugBDYiV3TUGZa6XypE58u5g0hRap4EIpVH8u+le8LhNMv8a43J"

config :three, ThreeWeb.Endpoint, server: true

cluster_strategy = System.get_env("CLUSTER_STRATEGY", "gossip")

topologies =
  case cluster_strategy do
    "gossip" ->
      [
        numbers: [
          strategy: Cluster.Strategy.Gossip
        ]
      ]

    "kubernetes_dns" ->
      [
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

    "consul" ->
      [
        one: [
          strategy: ClusterConsul.Strategy,
          config: [service_name: "cluster-one", application_name: "one"]
        ],
        two: [
          strategy: ClusterConsul.Strategy,
          config: [service_name: "cluster-two", application_name: "two"]
        ],
        three: [
          strategy: ClusterConsul.Strategy,
          config: [service_name: "cluster-three", application_name: "three", register: true]
        ]
      ]
  end

config :three, topologies: topologies
