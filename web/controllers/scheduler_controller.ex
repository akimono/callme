defmodule Callme.SchedulerController do
  use Callme.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  def providerform(conn, _params) do
  	Callme.Mailer.providerform(_params["name"], _params["email"], _params["comments"])
  	render conn, "providerform.html"
  end
end