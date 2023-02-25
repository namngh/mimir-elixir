defmodule MimirTest do
  use ExUnit.Case
  doctest Mimir

  test "greets the world" do
    assert Mimir.hello() == :world
  end
end
