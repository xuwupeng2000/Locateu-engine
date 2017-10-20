class Api::V1::GeoTracksController < ApplicationController
  skip_before_action :authenticate_user

  # Record the Geo tracks of sensor
  # We will need to know the UUID(serial_number) of sensor, lat and lng, no more than that
  def create
    @sensor = Sensor.find(sensor_params[:serial_code])
    @geo_track = @sensor.geo_tracks.build(geo_track_params)

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

end