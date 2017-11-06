require 'rails_helper'

RSpec.describe Api::V1::GeoTracksController, type: :controller do
  render_views

  describe "POST create" do

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
end
