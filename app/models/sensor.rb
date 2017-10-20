# Our sensor, one user can have many of sensor
# Each sensor have many geo tracks
class Sensor < ApplicationRecord
  belongs_to :user
end
