 defmodule ReadingList.AuthController do
    use ReadingList.Web, :controller
    plug Ueberauth

    def request(conn, _params) do
      render(conn, "login.html", callback_url: Ueberauth.Strategy.Helpers.callback_url(conn))
    end
    
    def callback(%Plug.Conn{assigns: %{ueberauth_failure: fails}} = conn, _params) do
      conn
      |> put_flash(:error, hd(fails.errors).message)
      |> render("login.html", callback_url: Ueberauth.Strategy.Helpers.callback_url(conn))
    end

    def callback(%Plug.Conn{assigns: %{ueberauth_auth: auth}} = conn, _params) do
      # auth = %Ueberauth.Auth{
      #   credentials: %Ueberauth.Auth.Credentials{
      #     token: token,
      #     token_type: token_type,
      #     other: %{"id_token" => id_token}
      #   }
      # }
      redirect(conn, to: home_path(conn, :index))
    end
end