defmodule TwoTest do
  use ExUnit.Case
  doctest Two

  test "greets the world" do
    assert Two.hello() == :world
  end
end
