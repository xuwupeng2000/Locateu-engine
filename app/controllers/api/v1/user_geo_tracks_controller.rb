class Api::V1::UserGeoTracksController < ApplicationController
  before_action :authenticate_user

  def index
    head 200
  end
end
