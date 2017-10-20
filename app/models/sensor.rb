# Our sensor, one user can have many of sensor
# Each sensor have many geo tracks
class Sensor < ApplicationRecord
  belongs_to :user

  validates :serial_code,
    presence: true,
    uniqueness: {case_sensitive: false}

  validates_confirmation_of :serial_code
end
