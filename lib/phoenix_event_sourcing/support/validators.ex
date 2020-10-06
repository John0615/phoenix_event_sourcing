defmodule PhoenixEventSourcing.Validators do
  @uuid_regex ~r/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/

  def uuid do
    Skooma.Validators.regex(@uuid_regex)
  end
end
