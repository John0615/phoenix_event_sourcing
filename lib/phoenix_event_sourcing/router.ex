defmodule PhoenixEventSourcing.Router do
  use Commanded.Commands.Router

  # middleware(LeangooApi.Support.Middleware.ValidateCommand)

  # identify(Board, by: :board_uuid, prefix: "board-")

  # dispatch(
  #   [
  #     AddBoardMember,
  #     AddBoardColumn,
  #     AddBoardLane,
  #     CreatePersonalBoard,
  #     InitializeBoardFromLegacy,
  #     RenameBoardColumn
  #   ],
  #   to: Board,
  #   lifespan: BoardLifespan
  # )
end
