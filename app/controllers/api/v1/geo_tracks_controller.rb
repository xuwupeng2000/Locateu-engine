class Api::V1::GeoTracksController < ApplicationController

  # Record the Geo tracks of sensor
  # We will need to know the UUID(serial_number) of sensor, lat and lng, no more than that
  # eg of 3001
  # {"acc": "1", "cmd": "3001", "lat": "00.000000", "lng": "000.000000", "tid": "2600004009", "fence": "true", "power": "0", "speed": "0.00", "action": "create", "status": "", "gpstime": "20171204225005", "mileage": "0", "location": "0", "obdspeed": "0", "direction": "0.00", "controller": "api/v1/geo_tracks", "systemtime": "20171204225005"}
  def create
    @sensor   = Sensor.find_by(serial_code: sensor_params[:tid])
    _incoming = Hashie::Mash.new(incoming_params)

    if _incoming.cmd == '3001' # location report

      lng = _incoming.lng
      lat = _incoming.lat
      @geo_track = @sensor.geo_tracks.build(
         lnglat: to_gis_point(lng, lat)
      )
      @geo_track.save!

      head 201
    elsif _incoming.cmd == '3002' # heart beat

    elsif _incoming.cmd == '????' # EC

    else
      payload = ConvertedPayload.new(content: payload_params)
      payload.save!

      head 201
    end
  end

  private

  def sensor_params
    params.permit(
      :tid
    )
  end

  def incoming_params
    params.permit(
      :acc,
      :cmd,
      :gpstime,
      :systemtime,
      :lat,
      :lng
    )
  end

  def payload_params
    params.permit!
  end

  def to_gis_point(lng, lat)
    "Point(#{lng} #{lat})"
  end

end
