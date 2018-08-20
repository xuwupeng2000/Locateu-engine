# frozen_string_literal: true

require 'factory_girl'

# User.delete_all
Package.delete_all
22.times do
  FactoryGirl.create(:user)
end

22.times do
  FactoryGirl.create(:package)
end
