FactoryGirl.define do
  factory :geo_track do
    sensor
    lnglat {"Point(#{Faker::Address.longitude} #{Faker::Address.latitude})"}
  end
end
