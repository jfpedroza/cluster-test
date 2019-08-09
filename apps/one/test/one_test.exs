defmodule OneTest do
  use ExUnit.Case
  doctest One

  test "greets the world" do
    assert One.hello() == :world
  end
end
