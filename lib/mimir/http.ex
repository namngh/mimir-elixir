defmodule Mimir.Http do
  @push_api "/api/v1/push"

  @spec push(Cortexpb.WriteRequest.t()) :: {:error, any} | {:ok, Tesla.Env.t()}
  def push(%Cortexpb.WriteRequest{} = request) do
    request
    |> Cortexpb.WriteRequest.encode()
    |> :snappyer.compress()
    |> case do
      {:ok, payload} ->
        :post
        |> Finch.build("#{Application.get_env(:mimir) |> Keyword.get(:host)}#{@push_api}",
          body: payload,
          headers: [
            {"X-Prometheus-Remote-Write-Version", "0.1.0"},
            {"Content-Type", "application/x-protobuf"}
          ]
        )
        |> Finch.request(MimirFinch)

      e ->
        e
    end
  end
end
