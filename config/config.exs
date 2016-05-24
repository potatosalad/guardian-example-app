# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :blog_backend, BlogBackend.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "2cQPC2RqCKDOfgOwmoaa1djmLvo86Ntixvi9XwK20Tvlu4L2FS32/8BeJzn4uVig",
  render_errors: [accepts: ~w(json)],
  pubsub: [name: BlogBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["ES512"],
  issuer: "BlogBackend",
  ttl: { 30, :days },
  secret_key: %{
    "alg" => "ES512",
    "crv" => "P-521",
    "d" => "mhEZkkY6eUJKEVl4Qnjfnik3GZmvPsiQEJC3-9f-jiM2OSHPTTYkOzPfjWbOqhb5JARUaJzXL9YyqHJBDxM_VB8",
    "kty" => "EC", "use" => "sig",
    "x" => "AALDyto5SKJ73a7uqLjKLwoCjUvn6Ldpcade5FCOt1zsl9hJGIHVGlXN9ApEsAMo5QmmOlQ5s4C4Fhi2PvvHb9bc",
    "y" => "AUZGWn4yuFxXKuqYEds0cm31A0LxY5v7Bmur3LoJaykQrXxd-GdcX4ZH6_hot6VnVWBlsDcHjCBXjxLg0_uJLNM6"
  },
  serializer: BlogBackend.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
