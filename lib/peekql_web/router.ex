defmodule PeekqlWeb.Router do
  use PeekqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PeekqlWeb do
    pipe_through :api
  end
end
