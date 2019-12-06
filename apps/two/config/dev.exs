import Config

config :two,
  topologies: [
    numbers: [
      strategy: Cluster.Strategy.Gossip
    ]
  ]
