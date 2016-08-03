defmodule Callme.ContactController do
  use Callme.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  def contactform(conn, _params) do
  	Callme.Mailer.contact(_params["name"], _params["email"], _params["comments"])
  	render conn, "contactrequest.html"
  end
end