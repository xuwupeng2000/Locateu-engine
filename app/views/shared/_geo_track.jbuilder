json.lat geo_track.lnglat.lat
json.lng geo_track.lnglat.lon
json.(geo_track, :id, :created_at, :updated_at)
json.sensor do
  json.partial! 'shared/sensor', sensor: geo_track.sensor
end
json.user do
  json.partial! 'shared/user', user: geo_track.sensor.user
end
