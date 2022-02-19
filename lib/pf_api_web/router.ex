defmodule PfApiWeb.Router do
  use PfApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PfApiWeb do
    pipe_through :api
    get "/v1/user/:id", UserController, :show
    get "/v1/healthcheck", HealthCheckController, :index
  end
end
