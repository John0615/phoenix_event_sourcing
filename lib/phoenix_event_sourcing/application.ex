defmodule PhoenixEventSourcing.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixEventSourcing.Repo,
      # Start the Telemetry supervisor
      PhoenixEventSourcingWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixEventSourcing.PubSub},
      # Start the Endpoint (http/https)
      PhoenixEventSourcingWeb.Endpoint,
      PhoenixEventSourcing.CommandedApp,
      PhoenixEventSourcing.Boards.Supervisor,
      PhoenixEventSourcing.EsRepo,
      # Start the PubSub system
      # Start a worker by calling: PhoenixEventSourcing.Worker.start_link(arg)
      # {PhoenixEventSourcing.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixEventSourcing.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixEventSourcingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
