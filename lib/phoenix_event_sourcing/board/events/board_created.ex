defmodule PhoenixEventSourcing.Boards.Events.BoardCreated do
  @derive [Jason.Encoder]
  defstruct [
    :board_uuid,
    :board_id,
    :board_name,
    :visibility,
    :creator_id,
    :type,
    :status,
    :project_id,
    :agile_board_type,
    :begin_date,
    :end_date
  ]
end
