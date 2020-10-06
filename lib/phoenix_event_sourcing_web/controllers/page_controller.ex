defmodule PhoenixEventSourcingWeb.PageController do
  use PhoenixEventSourcingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
