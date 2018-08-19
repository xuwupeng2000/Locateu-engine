# User has encrypted profile just like its password digest.
# There are two copies of the profile. One is protected by user password, another is protected by EC password
# At any given time, server can't known the profile, EC can't tell the geo tracks
# Only user have the ability to connect those two together
class User < ApplicationRecord
  has_many :geo_tracks, through: :sensors
  has_many :geo_tracks


  has_secure_password
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :email, uniqueness: {case_sensitive: false}, email_format: { :message => 'is not in valid format' }, allow_nil: true
  validates_confirmation_of :password
  validates :serial_code,
    presence: true,
    uniqueness: {case_sensitive: false}

  def to_token_payload
    { sub: username }
  end

  def self.from_token_payload(payload)
    find_by_username(payload['sub'])
  end
end
