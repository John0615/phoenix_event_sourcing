defmodule PhoenixEventSourcing.Contexts.BoardsContext do
  alias PhoenixEventSourcing.CommandedApp


  def create_person_board(current_user_id, board_name, columns, lanes) do
    cmd = %PhoenixEventSourcing.Boards.Commands.CreatePersonalBoard{
      current_user_id: current_user_id,
      creator_id: current_user_id,
      board_uuid: UUID.uuid4(),
      board_name: board_name,
      agile_board_type: :normal,
      type: :kanban,
      columns:
        columns
        |> Enum.map(fn col_name ->
          %{column_index: -1, column_name: col_name, column_uuid: UUID.uuid4()}
        end),
      lanes:
        lanes
        |> Enum.map(fn _x ->
          lane_uuid = UUID.uuid4()

          %{
            lane_index: -1,
            lane_uuid: lane_uuid,
            lane_id:
              lane_uuid
              |> UUID.string_to_binary!()
              |> UUID.binary_to_string!(:hex)
              |> String.slice(0, 16)
          }
        end)
    }

    with :ok <- dispatch(cmd) do

      {:ok, cmd.board_uuid}
    end
  end

  def dispatch(cmd, opts \\ [consistency: :strong])

  def dispatch(%{} = cmd, opts) do
    cmd |> CommandedApp.dispatch(opts)
  end

  def dispatch(result, _), do: result
end
