class SerializableGeoTrack < JSONAPI::Serializable::Resource
  type 'geo_tracks'
  attribute :sensor_id
  attribute :lnglat
  attribute :metadada
  attribute :created_at
  attribute :updated_at
  has_one :user
end
