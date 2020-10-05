defmodule PhoenixEventSourcing.ES.Event do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:event_id, :binary_id, autogenerate: false}
  schema "events" do
    field(:event_type, :string)
    field(:causation_id, :binary_id)
    field(:correlation_id, :binary_id)
    field(:data, :string)
    field(:metadata, :string)
    field(:created_at, :utc_datetime)
  end

  def changeset(event, attrs) do
    event
    |> cast(attrs, [
      :event_type,
      :causation_id,
      :correlation_id,
      :data,
      :metadata,
      :created_at
    ])
  end

end
