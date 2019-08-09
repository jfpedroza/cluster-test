defmodule ThreeWeb.HomeController do
  use ThreeWeb, :controller

  def index(conn, _params) do
    json(conn, %{hello: "world"})
  end
end
