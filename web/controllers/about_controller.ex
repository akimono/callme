defmodule Callme.AboutController do
  use Callme.Web, :controller

  def index(conn, _params) do
  	 changeset = Callme.Searchzip.changeset(%Callme.Searchzip{})
  	 #Callme.Mailer.send("frank.cioppettini@gmail.com")
    render conn, "index.html", changeset: changeset
  end
end