defmodule PhxContextLearnWeb.Router do
  use PhxContextLearnWeb, :router

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

  scope "/", PhxContextLearnWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true
  end

  scope "/cms", PhxContextLearnWeb.CMS, as: :cms do
    pipe_through [:browser, :authenticate_user] 

    resources "/pages", PageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxContextLearnWeb do
  #   pipe_through :api
  # end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
      user_id -> 
        assign(conn, :current_user, PhxContextLearn.Accounts.get_user!(user_id))
    end
  end
end
