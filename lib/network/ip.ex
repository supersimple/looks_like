defmodule LooksLike.Network.IP do
  @moduledoc """
  Functionality for working with IP addresses.
  """

  @doc """
  Follows the known pattern for IPv4 addresses (0-255.0-255.0-255.0-255).
  """
  @spec ipv4(String.t()) :: boolean
  def ipv4(str) do
    str
    |> String.trim()
    |> String.match?(
      ~r/^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}$/
      )
  end

  @doc """
  Follows the known pattern for IPv6 addresses.
  """
  @spec ipv6(String.t()) :: boolean
  def ipv6(str) do
    with str <- String.split(str, ":"),
         true <- length(str) <= 8,
         true <- length(str) >= 3,
         str <- Enum.filter(str, &String.length(&1) > 0),
         true <- Enum.all?(str, &String.match?(&1, ~r/^[0-9a-fA-F]{1,4}$/)) do
      true
    else
      _ -> false
    end
  end
end
