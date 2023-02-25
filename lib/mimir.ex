defmodule Mimir do
  def push(%Cortexpb.WriteRequest{} = request) do
    Mimir.Http.push(request)
  end
end
