defmodule PhoenixEventSourcing.CommandedApp do
  alias Commanded.Aggregates.Aggregate

  use Commanded.Application,
    otp_app: :phoenix_event_sourcing,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: PhoenixEventSourcing.EventStore
    ]

  router(PhoenixEventSourcing.Router)

  def aggregate_state(module, uuid) do
    Commanded.Aggregates.Aggregate.aggregate_state(__MODULE__, module, uuid)
  end

  def board_state(uuid) do
    __MODULE__
    |> Aggregate.aggregate_state(PhoenixEventSourcing.Boards.Aggregates.Board, "board-" <> uuid)
  end

  def open_board(uuid) do
    __MODULE__
    |> Commanded.Aggregates.Supervisor.open_aggregate(
      PhoenixEventSourcing.Boards.Aggregates.Board,
      "board-" <> uuid
    )
  end
end
