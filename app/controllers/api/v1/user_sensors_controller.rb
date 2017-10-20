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
  def destroy
    @sensor = current_user.sensors.find_by(serial_code: params[:id])
    @sensor.destroy!

    @sensors = current_user.sensors
    render :index
  end

  # List all sensors with user
  def index
    @sensors = current_user.sensors
  end

  private

  def sensor_params
    params.require(:sensor).permit(
      :serial_code,
      :serial_code_confirmation
    )
  end

end
