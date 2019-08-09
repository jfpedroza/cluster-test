defmodule One.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    topologies = [
      numbers: [
        strategy: Cluster.Strategy.Gossip
      ]
    ]

    children = [
      {Cluster.Supervisor, [topologies, [name: One.ClusterSupervisor]]}
    ]

    opts = [strategy: :one_for_one, name: One.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
