defmodule PhoenixEventSourcing.Boards.Supervisor do
  use Supervisor

  def start_link(opt \\ []) do
    Supervisor.start_link(__MODULE__, opt, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      # Projectors
      worker(PhoenixEventSourcing.Boards.Projectors.BoardCreatedProjector, [], id: :board_created_projector),
    ]

    supervise(children, strategy: :one_for_one)
  end
end
