defmodule LooksLike.Geo.Location do
  @moduledoc """
  Functionality for working with latitude and longitude coordinates.
  """

  @doc """
  Follows a valid pattern for latitude and longitude coordinates.
  """
  @spec latlon(String.t()) :: boolean
  def latlon(str) do
    # check for patterns like:
    # 0.0,0.0
    # 0.0, 0.0
    #0°24'14.0"N, 0°24'14.0"E
    case String.split(str, ",") do
      [segment1, segment2] ->
        seg1 = String.trim(segment1)
        seg2 = String.trim(segment2)
        valid_float_range?(seg1, seg2) || valid_string_pattern?(seg1, seg2)
      _ -> false
    end
  end

  defp valid_float_range?(seg1, seg2) do
    String.match?(seg1, ~r/^[\-]?[\d]{1,3}\.[\d]+$/) &&
      String.match?(seg2, ~r/^[\-]?[\d]{1,3}\.[\d]+$/)
  end

  defp valid_string_pattern?(seg1, seg2) do
    String.match?(seg1, ~r/^[\d]{1,3}°[\s]?[\d]{1,2}'[\s]?[\d]{1,2}(\.[\d]+)?["]?[\s]?[N|S]?$/) &&
      String.match?(seg2, ~r/^[\d]{1,3}°[\s]?[\d]{1,2}'[\s]?[\d]{1,2}(\.[\d]+)?["]?[\s]?[E|W]?$/)
  end
end
