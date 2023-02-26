import Config

config :example, ExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "NdWLkL5E0MQK5AvYu3d62YChfBO1hp6llbxk6AeUgE8MWBgC8S662gBH5s9DQRDp",
  server: false

config :logger, level: :warn

config :phoenix, :plug_init_mode, :runtime
