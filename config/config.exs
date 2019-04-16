# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_context_learn,
  ecto_repos: [PhxContextLearn.Repo]

# Configures the endpoint
config :phx_context_learn, PhxContextLearnWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "z9e0s+wJoXmOxRxWHoFPtq83US5oxCKKh8t7uxgitVhdgg84lhfIi2KDkI6lBt7e",
  render_errors: [view: PhxContextLearnWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxContextLearn.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
