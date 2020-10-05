defmodule PhoenixEventSourcing.ES.Stream do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:stream_id, :integer, autogenerate: false}
  schema "streams" do
    field(:stream_uuid, :string)
    field(:stream_version, :integer)
    field(:created_at, :utc_datetime)

    has_many(:stream_events, PhoenixEventSourcing.ES.StreamEvent, foreign_key: :stream_id)
  end

  def changeset(event, attrs) do
    event
    |> cast(attrs, [
      :stream_uuid,
      :stream_version,
      :created_at
    ])
  end
end
