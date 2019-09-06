# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :peekql,
  ecto_repos: [Peekql.Repo]

# Configures the endpoint
config :peekql, PeekqlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zoSa0OHd0G+DZlOsbf62kjczyuS17fiOC4ei0WqmD0XtsBAwyKDCftyAfd9QU88u",
  render_errors: [view: PeekqlWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Peekql.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
