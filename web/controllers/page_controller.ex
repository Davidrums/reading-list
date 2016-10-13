defmodule ReadingList.PageController do
  use ReadingList.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end
