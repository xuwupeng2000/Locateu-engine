require 'rails_helper'

RSpec.describe SensorEndCommandService, type: :controller do
  subject(:service) {
    device_uuid = '2600004009'
    SensorEndCommandService.new(device_uuid)
  }

  describe "#change_server_ip_address" do

    context 'with valid params' do
      # We don't want to change that
      xit "should respond as expected"  do
        expect(
          service.change_server_ip_address()
        ).to
      end
    end

  end

  describe "#change_update_frequency" do
    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.change_update_frequency(600)
        expect(resp.code).to eq 200
      end
    end
  end

  describe "#set_ec_number" do
    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.set_ec_number('02102557852')
        expect(resp.code).to eq 200
      end
    end
  end

  describe "#set_controller_number" do
    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.set_controller_number('02102557852')
        expect(resp.code).to eq 200
      end
    end
  end

  describe "#make_phone_call" do
    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.make_phone_call('02102557852')
        expect(resp.code).to eq 200
      end
    end
  end

  describe "#start_remote_listening" do
    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.start_remote_listening()
        expect(resp.code).to eq 200
      end
    end
  end

  describe "#reset_settings" do
    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.reset_settings
        expect(resp.code).to eq 200
      end
    end
  end

  describe "#restart_device" do
    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.restart_device
        expect(resp.code).to eq 200
      end
    end
  end

  describe "#turn_off_device" do
    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.turn_off_device
        expect(resp.code).to eq 200
      end
    end
  end

  describe "#set_setting_of_txt_sos" do

    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.set_setting_of_txt_sos(1)
        expect(resp.code).to eq 200
      end
    end
  end

  describe "#query_device_version" do

    context 'with valid params' do
      it "should respond as expected"  do
        resp = service.query_device_version
        expect(resp.code).to eq 200
      end
    end
  end

end
