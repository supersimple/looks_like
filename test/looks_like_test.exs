defmodule LooksLikeTest do
  use ExUnit.Case

  test "latlon?" do
    assert LooksLike.latlon?("0.0,0.0")
  end

  test "ipv4?" do
    assert LooksLike.ipv4?("192.168.1.1")
  end

  test "ipv6?" do
    assert LooksLike.ipv6?("2601:3cb:b00:4a20:20ab:f983:d6b7:f1fa")
  end
end
