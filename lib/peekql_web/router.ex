defmodule PeekqlWeb.Router do
  use PeekqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/api", PeekqlWeb do
  #   pipe_through :api
  # end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PeekqlWeb.Schema,
      interface: :simple,
      context: %{pubsub: PeekqlWeb.Endpoint}
  end
end
