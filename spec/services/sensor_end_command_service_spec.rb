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

  end

  describe "#set_controller_number" do

  end

  describe "#make_phone_call" do

  end

  describe "#start_remote_listening" do

  end

  describe "#reset_settings" do

  end

  describe "#restart_device" do

  end

  describe "#turn_off_device" do

  end

  describe "#set_setting_of_txt_sos" do

  end

  describe "#query_device_version" do

  end

end
