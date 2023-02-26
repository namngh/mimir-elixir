defmodule Mimir do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {Finch, name: MimirFinch}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def push(%Cortexpb.WriteRequest{} = request) do
    Mimir.Http.push(request)
  end
end
