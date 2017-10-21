FactoryGirl.define do
  factory :user do
    username {Faker::Name.name.gsub(' ', '_')}
    email { Faker::Internet.email }
    password '1password'

  end
end
