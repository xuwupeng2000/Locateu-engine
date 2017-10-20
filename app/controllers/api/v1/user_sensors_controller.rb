class Api::V1::UserSensorsController < ApplicationController
  before_action :authenticate_user

  # Link sensor with user
  def create
    @user   = current_user
    @sensor = current_user.sensors.build(sensor_params)

    if @sensor.save
      render :show
    else
      render :error, status: 422
    end
  end

  # Unlink sensor with user
  def delete
    @sensor = current_user.sensors.find(sensor_params(:serial_code))
    @sensor.destroy!
  end

  # List all sensors with user
  def index
    @sensors = current_user.sensors
  end

  private

  def sensor_params
    params.require(:sensor).permit(:serial_code, :serial_code_confirmation)
  end

end
