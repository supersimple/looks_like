defmodule LooksLike.Network.IPTest do
  use ExUnit.Case

  describe "ipv4/1" do
    test "valid ipv4 string" do
      random_ip =
        for _n <- 1..4 do
          random_8_bit()
        end
        |> Enum.join(".")

      assert LooksLike.Network.IP.ipv4(random_ip)
    end

    test "invalid ipv4 string" do
      refute LooksLike.Network.IP.ipv4("256.0.0.0")
      refute LooksLike.Network.IP.ipv4("1.0.0")
      refute LooksLike.Network.IP.ipv4("2601:3cb:b00:4a20:20ab:f983:d6b7:f1fa")
    end
  end

  describe "ipv6/1" do
    test "valid ipv6 string" do
      assert LooksLike.Network.IP.ipv6("2601:3cb:b00:4a20:20ab:f983:d6b7:f1fa")
      assert LooksLike.Network.IP.ipv6("::1")
      assert LooksLike.Network.IP.ipv6("2601:3cb:b00:4a20::0")
    end

    test "invalid ipv6 string" do
      refute LooksLike.Network.IP.ipv6("256.0.0.0")
      refute LooksLike.Network.IP.ipv6("1.0.0")
      refute LooksLike.Network.IP.ipv6("")
    end
  end

  defp random_8_bit do
    Enum.random(0..255) |> to_string()
  end
end
