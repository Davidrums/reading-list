defmodule ReadingList.LoginController do
  use ReadingList.Web, :controller

  def index(conn, _params) do
    render conn, "login.html"
  end
end