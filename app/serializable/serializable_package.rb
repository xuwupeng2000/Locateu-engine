class SerializablePackage < JSONAPI::Serializable::Resource
  type 'packages'
  attribute :name
  attribute :category
  attribute :logo
  attribute :web_url
  attribute :phone
  attribute :created_at
  attribute :updated_at
  has_one :user
end
