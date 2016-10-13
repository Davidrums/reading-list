defmodule ReadingList.HomeController do
  use ReadingList.Web, :controller

  def index(conn, _params) do
  	
    render conn, "home.html"
  end
end