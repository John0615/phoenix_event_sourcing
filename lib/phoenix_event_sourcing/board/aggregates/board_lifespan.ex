defmodule PhoenixEventSourcing.Boards.Aggregates.BoardLifespan do
  @behaviour Commanded.Aggregates.AggregateLifespan

  @default_lifespan :timer.minutes(30)

  def after_event(_event), do: @default_lifespan

  def after_command(_command), do: @default_lifespan

  def after_error(_error), do: :stop
end
