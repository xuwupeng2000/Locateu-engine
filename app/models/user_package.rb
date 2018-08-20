class UserPackage < ApplicationRecord
  belongs_to :user
  belongs_to :package
end