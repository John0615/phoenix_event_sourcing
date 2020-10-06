defmodule PhoenixEventSourcing.Router do
  use Commanded.Commands.Router

  alias PhoenixEventSourcing.Boards.Aggregates.Board
  alias PhoenixEventSourcing.Boards.Aggregates.BoardLifespan

  alias PhoenixEventSourcing.Boards.Commands.{
    CreatePersonalBoard
  }

  middleware(PhoenixEventSourcing.Support.Middleware.ValidateCommand)

  identify(Board, by: :board_uuid, prefix: "board-")

  dispatch(
    [
      CreatePersonalBoard
    ],
    to: Board,
    lifespan: BoardLifespan
  )
end
