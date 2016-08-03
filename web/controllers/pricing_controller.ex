defmodule Callme.PricingController do
  use Callme.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  def pricingform(conn, _params) do
  	Callme.Mailer.pricingform(_params["name"], _params["email"])
  	render conn, "pricingform.html"
  end
end