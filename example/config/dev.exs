import Config

config :example, ExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "T63ptAS9g7e9vxFFMjeu+la4ACFrWmpr/Pz8T1N4mDLSedW5gDMEuCxF58ZwksHm",
  watchers: []

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
