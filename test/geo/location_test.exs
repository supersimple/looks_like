defmodule LooksLike.Geo.LocationTest do
  use ExUnit.Case

  describe "latlon/1" do
    test "valid latitude and longitude coordinates" do
      assert LooksLike.Geo.Location.latlon("0.0,0.0")
      assert LooksLike.Geo.Location.latlon("0.0, 0.0")
      assert LooksLike.Geo.Location.latlon("0°24'14.0\"N, 0°24'14.0\"E")
    end

    test "invalid latitude and longitude coordinates" do
      refute LooksLike.Geo.Location.latlon("-39/67.34")
      refute LooksLike.Geo.Location.latlon("0.0,0.0,0.0")
      refute LooksLike.Geo.Location.latlon("0.0, 0.0, 0.0")
      refute LooksLike.Geo.Location.latlon("0°24'14.0\"N, 0°24'14.0\"E, 0°24'14.0\"S")
    end
  end
end
