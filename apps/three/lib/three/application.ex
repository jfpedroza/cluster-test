defmodule Three.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    topologies = Application.get_env(:three, :topologies)

    children = [
      {Cluster.Supervisor, [topologies, [name: Three.ClusterSupervisor]]},
      supervisor(ThreeWeb.Endpoint, [])
    ]

    opts = [strategy: :one_for_one, name: Three.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ThreeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
