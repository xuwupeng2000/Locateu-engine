class Api::V1::UserSensorsController < ApplicationController

  # Link sensor with user
  def create
    @user   = current_user
    @sensor = current_user.sensors.build(sensor_params)

    if @sensor.save
      render :show
    else
      render :not_found, status: 404
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
    params.reqire(:sensor).permit(:serial_code)
  end

end