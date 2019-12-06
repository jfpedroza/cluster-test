import Config

config :one,
  topologies: [
    numbers: [
      strategy: Cluster.Strategy.Gossip
    ]
  ]
