defmodule WiredTest do
  use ExUnit.Case
  doctest Wired

  test "greets the world" do
    assert Wired.hello() == :world
  end
end
