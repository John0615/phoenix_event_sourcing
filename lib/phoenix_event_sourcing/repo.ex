defmodule PhoenixEventSourcing.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_event_sourcing,
    adapter: Ecto.Adapters.Postgres
end
