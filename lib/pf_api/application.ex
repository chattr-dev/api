defmodule PfApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PfApi.Repo,
      # Start the Telemetry supervisor
      PfApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PfApi.PubSub},
      # Start the Endpoint (http/https)
      PfApiWeb.Endpoint,
      # Start a worker by calling: PfApi.Worker.start_link(arg)
      # {PfApi.Worker, arg}
      PfApiWeb.UserPresence
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PfApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PfApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
