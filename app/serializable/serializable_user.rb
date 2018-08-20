class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'
  attribute :username
  attribute :password_digest
  attribute :email
  attribute :created_at
  attribute :updated_at
  attribute :name
  attribute :ec1
  attribute :ec2
  attribute :serial_code
  has_many :geo_tracks
  has_many :packages
end
