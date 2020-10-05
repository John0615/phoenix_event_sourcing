defmodule PhoenixEventSourcing.ES.StreamEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "stream_events" do
    field(:event_id, :binary_id, primary_key: true)
    field(:stream_id, :integer, primary_key: true)
    field(:stream_version, :integer)
    field(:original_stream_id, :integer)
    field(:original_stream_version, :integer)

    belongs_to(:event, PhoenixEventSourcing.ES.Event, references: :event_id, define_field: false)
  end

  def changeset(event, attrs) do
    event
    |> cast(attrs, [
      :stream_version,
      :original_stream_id,
      :original_stream_version
    ])
  end
end
