class Api::V1::GeoTracksController < ApplicationController
  # Record the Geo tracks of sensor
  # We will need to know the UUID(serial_number) of sensor, lat and lng, no more than that
  def create
    @sensor = Sensor.find(sensor_params[:serial_code])
    lng = geo_track_params[:lng]
    lat = geo_track_params[:lat]
    @geo_track = @sensor.geo_tracks.build(
      lnglat: to_gis_point(lng, lat)
    )

    @geo_track.save!
    render :show
  end

  private

  def sensor_params
    params.require(:geo_track).permit(
      :serial_code
    )
  end

  def geo_track_params
    params.require(:geo_track).permit(
      :lat,
      :lng
    )
  end

  def to_gis_point(lng, lat)
    "Point(#{lng} #{lat})"
  end
end
