defmodule ReadingList.Router do
  use ReadingList.Web, :router

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

  scope "/", ReadingList do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", LoginController, :index
  end

  scope "/auth", ReadingList do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  scope "/app", ReadingList do
    pipe_through :browser

    get "/", HomeController, :index, as: :home
  end
  # Other scopes may use custom stacks.
  # scope "/api", ReadingList do
  #   pipe_through :api
  # end
end
