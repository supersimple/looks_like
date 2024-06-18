defmodule LooksLike do
  @moduledoc """
  Interface for all comparison functions.
  """

  @doc """
  Follows a valid pattern for latitude and longitude coordinates.
  """
  defdelegate latlon?(str), to: LooksLike.Geo.Location, as: :latlon

  @doc """
  Follows a valid pattern for an ipv4 address.
  """
  defdelegate ipv4?(str), to: LooksLike.Network.IP, as: :ipv4

  @doc """
  Follows a valid pattern for an ipv6 address.
  """
  defdelegate ipv6?(str), to: LooksLike.Network.IP, as: :ipv6
end
