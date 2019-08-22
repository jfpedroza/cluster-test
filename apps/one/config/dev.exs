use Mix.Config

config :one,
  topologies: [
    numbers: [
      strategy: Cluster.Strategy.Gossip
    ]
  ]
