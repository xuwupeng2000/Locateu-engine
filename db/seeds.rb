# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#

require 'factory_girl_rails'
require 'active_support'

jack  = FactoryGirl.create(:user, username: 'jack', password: 'pass')
arron = FactoryGirl.create(:user, username: 'aaron', password: 'pass')
bill  = FactoryGirl.create(:user, username: 'bill', password: 'pass')

_sensor_jack = FactoryGirl.create(:sensor, user: jack)
_sensor_arron = FactoryGirl.create(:sensor, user: arron)
_sensor_bill = FactoryGirl.create(:sensor, user: bill)

10.times do
  [_sensor_jack, _sensor_arron, _sensor_bill].each do |sensor|
    track = FactoryGirl.create(:geo_track, sensor: sensor)
  end
end
