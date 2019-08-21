defmodule ThreeWeb.HomeController do
  use ThreeWeb, :controller

  def index(conn, _params) do
    json(conn, %{me: Node.self(), neighbors: Node.list()})
  end
end
