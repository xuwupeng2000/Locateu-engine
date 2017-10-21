# A geo point class
class GeoTrack < ApplicationRecord
  belongs_to :sensor
  validates_presence_of :lnglat

end
