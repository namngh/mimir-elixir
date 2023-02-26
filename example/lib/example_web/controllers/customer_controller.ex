defmodule ExampleWeb.CustomerController do
  use ExampleWeb, :controller

  def track(conn, _params) do
    Mimir.Metric.Counter.new("track_customer", help: "Tracking customer", unit: "view")
    |> Mimir.Metric.Counter.send(1)
    |> case do
      {:ok, _} ->
        conn
        |> json(%{success: true})

      _ ->
        conn
        |> json(%{success: false})
    end
  end
end
