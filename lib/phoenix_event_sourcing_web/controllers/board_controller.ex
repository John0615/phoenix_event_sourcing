defmodule PhoenixEventSourcingWeb.BoardController do
  use PhoenixEventSourcingWeb, :controller
  alias PhoenixEventSourcing.Contexts.BoardsContext

  def create(conn, _params) do
    BoardsContext.create_person_board(392_150, "test火星移民计划Sprint 1", ["test用户故事", "test待办", "test进行中", "test已完成"], ["test泳道1"])
    json(conn, %{})
  end
end
