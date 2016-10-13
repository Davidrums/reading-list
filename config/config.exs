# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :reading_list,
  ecto_repos: [ReadingList.Repo]

# Configures the endpoint
config :reading_list, ReadingList.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Dz/O7nvoApaEHzK6JHa0xrynouH7B6IYpmOZnqq9Yfi/ZDL6/6/6ZEIGLizxAEM3",
  render_errors: [view: ReadingList.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ReadingList.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Auth0
config :ueberauth, Ueberauth,
    providers: [
      auth0: {Ueberauth.Strategy.Auth0, []}
    ]

config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
      domain: System.get_env("AUTH0_BASEURL"),
      client_id: System.get_env("AUTH0_APP_ID"),
      client_secret: System.get_env("AUTH0_APP_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
