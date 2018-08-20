class Package < ApplicationRecord
  has_many :user_packages
  has_many :users, through: :user_packages
end
