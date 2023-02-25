defmodule Mimir.Http do
  use Tesla

  @push_api "/api/v1/push"

  plug(Tesla.Middleware.Retry,
    delay: 200,
    max_retries: 5,
    max_delay: 5_000,
    jitter_factor: 0.2,
    should_retry: fn
      {:ok, _} -> false
      {:error, _} -> true
    end
  )

  @spec push(Cortexpb.WriteRequest.t()) :: {:error, any} | {:ok, Tesla.Env.t()}
  def push(%Cortexpb.WriteRequest{} = request) do
    request
    |> Cortexpb.WriteRequest.encode()
    |> :snappyer.compress()
    |> case do
      {:ok, payload} ->
        @push_api
        |> post(payload,
          headers: [
            {"X-Prometheus-Remote-Write-Version", "0.1.0"},
            {"Content-Type", "application/x-protobuf"}
          ]
        )

      e ->
        e
    end
  end
end
