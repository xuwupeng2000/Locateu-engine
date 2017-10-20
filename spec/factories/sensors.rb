FactoryGirl.define do
  factory :sensor do
    user
    serial_code { Faker::Code.asin }

  end
end
