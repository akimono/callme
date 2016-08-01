# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :callme, Callme.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "jTrdsYnbNCqUuRuBqUIg0p6YKgUG3paPiZgB0ivCF45uWfUhZAd/zxuOiOe0GVKe",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Callme.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :arc,
  bucket: "callme"

config :ex_aws,
access_key_id: System.get_env("AWS_ACCESS_KEY"),
secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY")

 #.env library
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
import_config "config.secret.exs"
# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :callme, Callme.Repo,
adapter: Ecto.Adapters.Postgres,
username: "postgres",
password: "postgres",
database: "callme_dev",
hostname: "localhost",
pool_size: 10,
mailgun_domain: System.get_env("MAILGUN_DOMAIN"),
mailgun_key: System.get_env("MAILGUN_API_KEY")