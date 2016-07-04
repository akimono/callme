defmodule Callmemd.Router do
  use Callmemd.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Callmemd do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/contact", ContactController, :index
    get "/meded", MededController, :index
    get "/users", UserController, :index
    get "/scheduler", SchedulerController, :index
    get "/about", AboutController, :index
    get "/pricing", PricingController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Callmemd do
  #   pipe_through :api
  # end
end
