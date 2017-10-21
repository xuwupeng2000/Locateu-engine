class Api::V1::UserGeoTracksController < ApplicationController
  before_action :authenticate_user

  # List all the geo tracks we collected, grouped by sensor.
  # Kind of like search, you can select which sensor, when, and where, and we will then search it for you
  # Server don't know the user profile, we can only tell where each sensor have been
  # Where our Map UI data comes from
  def index
    @geo_tracks = current_user.geo_tracks.order(created_at: :desc)
    @sensors = current_user.sensors
  end

end
