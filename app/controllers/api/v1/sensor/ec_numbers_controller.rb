class Api::V1::Sensor::EcNumbersController < ApplicationController
  before_action :authenticate_user

  def show
    @sensor = current_user.sensors.find(params[:sensor_id])
  end

  def update
    @sensor = current_user.sensors.find(params[:sensor_id])
    @sensor.ec_number = number_params[:number]

    if @sensor.save
      service = SensorEndCommandService.new(@sensor.serial_code)
      service.set_ec_number(@sensor.ec_number)

      render :show
    else
      render 'shared/error',  locals: { object: @sensor }
    end

  end

  private

  def number_params
    params.require(:ec_number).permit(:number)
  end
end
