json.lat geo_track.lnglat.lat
json.lng geo_track.lnglat.lon
json.created_at geo_track.created_at.strftime('%F %T')
json.updated_at geo_track.updated_at.strftime('%F %T')
json.id geo_track.id
json.sensor do
  json.partial! 'shared/sensor', sensor: geo_track.sensor
end
json.user do
  json.partial! 'shared/user', user: geo_track.sensor.user
end
