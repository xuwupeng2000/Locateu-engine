FactoryGirl.define do
  factory :geo_track do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }

  end
end
