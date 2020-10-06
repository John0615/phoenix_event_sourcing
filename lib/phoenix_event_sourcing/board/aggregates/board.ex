defmodule PhoenixEventSourcing.Boards.Aggregates.Board do
  @derive [Jason.Encoder]
  defstruct uuid: nil,
            board_id: nil,
            board_name: nil,
            lane_order: nil,
            tag_order: nil,
            project_uuid: nil,
            project_id: 0,
            visibility: nil,
            creator_id: 0,
            agile_board_type: :normal,
            alert_threshold: nil,
            danger_threshold: nil,
            type: :kanban,
            status: :active,
            timezone_offset: nil,
            begin_date: nil,
            end_date: nil,
            board_members: [],
            columns: [],
            lanes: [],
            blocks: []


  alias Commanded.Aggregate.Multi

  alias PhoenixEventSourcing.Boards.Aggregates.Board

  alias PhoenixEventSourcing.Boards.Commands.{
    CreatePersonalBoard
  }

  alias PhoenixEventSourcing.Boards.Events.{
    BoardCreated
  }


  def execute(%Board{uuid: nil} = board, %CreatePersonalBoard{} = cmd) do
    board
    |> Multi.new()
    |> Multi.execute(&create_board(&1, cmd))
  end


  def create_board(%Board{} = _board, %CreatePersonalBoard{} = cmd) do
    %BoardCreated{
      board_uuid: cmd.board_uuid,
      board_name: cmd.board_name,
      project_id: 0,
      visibility: :board_members,
      creator_id: cmd.current_user_id,
      agile_board_type: cmd.agile_board_type,
      type: cmd.type,
      status: :active
    }
    |> assign_board_dates()
  end

  defp assign_board_dates(evt) do
    begin_date = Timex.local()
    end_date = Timex.add(begin_date, Timex.Duration.from_days(14))

    %BoardCreated{
      evt
      | begin_date: begin_date,
        end_date: end_date
    }
  end


  def apply(%Board{uuid: nil} = _board, %BoardCreated{} = evt) do
    %Board{
      uuid: evt.board_uuid,
      board_id: evt.board_id,
      board_name: evt.board_name,
      visibility: evt.visibility,
      creator_id: evt.creator_id,
      type: evt.type,
      status: evt.status,
      project_id: evt.project_id,
      agile_board_type: evt.agile_board_type,
      board_members: [],
      columns: [],
      lanes: [],
      blocks: []
    }
  end

end
