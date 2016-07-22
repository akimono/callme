defmodule Callme.AboutController do
  use Callme.Web, :controller

  def index(conn, _params) do
  	 changeset = Callme.Searchzip.changeset(%Callme.Searchzip{})
    render conn, "index.html", changeset: changeset
  end
end