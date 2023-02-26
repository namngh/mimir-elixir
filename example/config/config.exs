import Config

config :example, ExampleWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ExampleWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Example.PubSub,
  live_view: [signing_salt: "aeImBpSC"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :mimir,
  host: "http://localhost:9009"

import_config "#{config_env()}.exs"
