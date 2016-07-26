defmodule Callme.Router do
  use Callme.Web, :router

pipeline :browser do
plug :accepts, ["html"]
plug :fetch_session
plug :fetch_flash
plug :protect_from_forgery
plug :put_secure_browser_headers
plug Callme.Auth, repo: Callme.Repo
end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Callme do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/contact", ContactController, :index
    get "/meded", MededController, :index
    resources "/users", UserController
    get "/scheduler", SchedulerController, :index
    get "/about", AboutController, :index
    get "/pricing", PricingController, :index
    post "/logincreate", UserController, :logincreate
    post "/users/:id", UserController, :update
    get "login", UserController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/doctors", DoctorController
    resources "/services", ServiceController
    resources "/zipcodes", ZipcodeController
    post "/zipsearch", SearchController, :zipsearch
    get "/serivceshow", SearchController, :serviceshow
    post "refinesearch", SearchController, :refinesearch
    resources "/videos", VideoController
    get "/bytopic", MededController, :bytopic
  end

  # Other scopes may use custom stacks.
  # scope "/api", Callmemd do
  #   pipe_through :api
  # end
end
