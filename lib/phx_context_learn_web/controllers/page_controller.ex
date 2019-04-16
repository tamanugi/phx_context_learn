defmodule PhxContextLearnWeb.PageController do
  use PhxContextLearnWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
