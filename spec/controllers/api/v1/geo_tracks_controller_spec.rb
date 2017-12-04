require 'rails_helper'

RSpec.describe Api::V1::GeoTracksController, type: :controller do
  render_views

  describe "POST create" do

    context 'when the cmd is unrecognizable' do
      it "should save the post params into payload"  do
        expect{
          post :create, params: {something: {lat: 'yoooo', lng: 22322}, other_stuffs: {great: 'maybe yes', natesed: {natesed: 'pretty structure'}}}
        }.to change{ConvertedPayload.count}.by(1)
      end

      it "should save the post params as it was posted"  do
        post :create, params: {something: {lat: 'yoooo', lng: 22322}, other_stuffs: {great: 'maybe yes', natesed: {natesed: 'pretty structure'}}}

        mash = to_mash(ConvertedPayload.last.content)
        expect(mash.something.lat).to eq 'yoooo'
      end
    end

    context '3001' do

      # {"acc": "1", "cmd": "3001", "lat": "00.000000", "lng": "000.000000", "tid": "2600004009", "fence": "true", "power": "0",
      # "speed": "0.00", "action": "create", "status": "", "gpstime": "20171204225005",
      # "mileage": "0", "location": "0", "obdspeed": "0", "direction": "0.00", "controller": "api/v1/geo_tracks", "systemtime": "20171204225005"}
      it "should create geo_track record" do
        _device = FactoryGirl.create(:sensor)
        expect{
          post :create, params: {tid: _device.serial_code, acc: "1", cmd: '3001', lng: '000.000000', lat: "000.000000", power: "0", fence: "true", speed: "0.00", gpstime: "20171204225005", systemtime: "20171204225005"}
        }.to change{GeoTrack.count}.by(1)
      end
    end

    context '3002' do

    end

  end
end
