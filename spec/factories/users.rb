FactoryGirl.define do
  factory :user do
    username { Faker::Name.name.tr(' ', '_') }
    email { Faker::Internet.email }
    serial_code { Faker::Crypto.md5 }
    password '1password'
    name { Faker::Name.name }
  end
end
