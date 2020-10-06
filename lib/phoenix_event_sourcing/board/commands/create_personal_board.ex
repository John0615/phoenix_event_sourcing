defmodule PhoenixEventSourcing.Boards.Commands.CreatePersonalBoard do
  defstruct [
    :current_user_id,
    :board_uuid,
    :board_id,
    :board_name,
    :visibility,
    :creator_id,
    :type,
    :status,
    :project_id,
    :agile_board_type,
    :alert_threshold,
    :danger_threshold,
    :timezone_offset,
    :begin_date,
    :end_date,
    :board_members,
    :columns,
    :lanes,
    :blocks
  ]

  def valid?(command) do
    Skooma.valid?(Map.from_struct(command), schema())
  end

  def schema() do
    %{
      board_uuid: [:string, PhoenixEventSourcing.Validators.uuid]
    }
  end

end
