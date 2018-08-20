# A geo point class
class GeoTrack < ApplicationRecord
  belongs_to :user
  validates_presence_of :lnglat
end
