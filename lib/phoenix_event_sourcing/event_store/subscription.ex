defmodule PhoenixEventSourcing.ES.Subscription do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:subscription_id, :integer, autogenerate: false}
  schema "subscriptions" do
    field(:stream_uuid, :string)
    field(:subscription_name, :string)
    field(:last_seen, :integer)
    field(:created_at, :utc_datetime)

    belongs_to(:stream, PhoenixEventSourcing.ES.Stream, foreign_key: :stream_uuid, references: :stream_uuid, define_field: false)
  end

  def changeset(event, attrs) do
    event
    |> cast(attrs, [
      :stream_uuid,
      :subscription_name,
      :last_seen,
      :created_at
    ])
  end
end
