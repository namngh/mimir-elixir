defmodule Mimir.MixProject do
  use Mix.Project

  def project do
    [
      app: :mimir,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.5"},
      {:snappyer, "~> 1.2"},
      {:finch, "~> 0.14.0"},
      {:protobuf, "~> 0.11.0"}
    ]
  end
end
