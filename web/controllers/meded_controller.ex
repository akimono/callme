defmodule Callme.MededController do
  use Callme.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end