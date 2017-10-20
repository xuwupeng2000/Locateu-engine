json.(geo_track, :lat, :lng, :created_at, :updated_at)
json.sensor do
  json.partial! 'shared/sensor', user: geo_track.sensor
end
json.user do
  json.partial! 'shared/user', user: geo_track.sensor.user
end
