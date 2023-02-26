defmodule ExampleWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :example

  @session_options [
    store: :cookie,
    key: "_example_key",
    signing_salt: "YsJ5JNGk"
  ]

  plug(Plug.Static,
    at: "/",
    from: :example,
    gzip: false,
    only: ~w(assets fonts images favicon.ico robots.txt)
  )

  if code_reloading? do
    plug(Phoenix.CodeReloader)
  end

  plug(Plug.RequestId)
  plug(Plug.Telemetry, event_prefix: [:phoenix, :endpoint])

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)
  plug(Plug.Session, @session_options)
  plug(ExampleWeb.Router)
end
