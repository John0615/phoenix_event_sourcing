# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_event_sourcing,
  ecto_repos: [PhoenixEventSourcing.Repo]

# Configures the endpoint
config :phoenix_event_sourcing, PhoenixEventSourcingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JvkxiZHDuPo1OC4gI7YgqpiExGpgJ39alqVNEyHOfaJhrgt+E26kxittMe9zkNdQ",
  render_errors: [view: PhoenixEventSourcingWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixEventSourcing.PubSub,
  live_view: [signing_salt: "DYookIQT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix_event_sourcing, event_stores: [PhoenixEventSourcing.EventStore]

config :phoenix_event_sourcing, PhoenixEventSourcing.CommandedApp,
  pubsub: [
    phoenix_pubsub: [
      adapter: Phoenix.PubSub.PG2,
      pool_size: 1
    ]
  ]

config :phoenix_event_sourcing, PhoenixEventSourcing.EventStore, registry: :distributed

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
