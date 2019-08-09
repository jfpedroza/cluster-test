defmodule ThreeWeb.Router do
  use ThreeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ThreeWeb do
    pipe_through :api
  end
end
