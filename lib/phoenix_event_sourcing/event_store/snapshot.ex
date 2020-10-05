defmodule PhoenixEventSourcing.ES.Snapshot do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:source_uuid, :string, autogenerate: false}
  schema "snapshots" do
    field(:source_type, :string)
    field(:source_version, :integer)
    field(:data, :string)
    field(:metadata, :string)
    field(:created_at, :utc_datetime)

    has_many(:stream_events, PhoenixEventSourcing.ES.StreamEvent, foreign_key: :stream_id)
  end

  def changeset(event, attrs) do
    event
    |> cast(attrs, [
      :source_type,
      :source_version,
      :data,
      :metadata,
      :created_at
    ])
  end
end
