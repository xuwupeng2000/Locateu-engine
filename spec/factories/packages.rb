FactoryGirl.define do
  factory :package do
    name { Faker::Company.name }
    category { Faker::Commerce.department }
    web_url { Faker::Internet.url }
    logo { Faker::Avatar.image }
  end
end
