defmodule ThreeWeb.Router do
  use ThreeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ThreeWeb do
    pipe_through :api

    get("/", HomeController, :index)
  end
end
