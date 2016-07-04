defmodule Callmemd.ContactController do
  use Callmemd.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end