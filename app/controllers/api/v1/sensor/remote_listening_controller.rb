class Api::V1::Sensor::RemoteListeningController < ApplicationController
  before_action :authenticate_user

  def create
    @sensor = current_user.sensors.find(params[:sensor_id])
    service = SensorEndCommandService.new(@sensor.serial_code)
    service.start_remote_listening

    head 200
  end

end
