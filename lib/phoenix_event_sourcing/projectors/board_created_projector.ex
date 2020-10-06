defmodule PhoenixEventSourcing.Boards.Projectors.BoardCreatedProjector do
  use Commanded.Projections.Ecto,
    name: "Boards.Projectors.BoardCreated",
    application: PhoenixEventSourcing.CommandedApp,
    repo: PhoenixEventSourcing.Repo,
    consistency: :strong

  alias PhoenixEventSourcing.Boards.Events.{
    BoardCreated
  }

  project(%BoardCreated{} = _created, fn multi ->
    #todo 插入数据库
    multi
    |> IO.inspect(label: "0s0s0s0s0", pretty: true)
  end)
end
