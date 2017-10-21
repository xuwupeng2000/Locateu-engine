json.geo_tracks @geo_tracks do |geo_track|
  json.partial! 'shared/geo_track', geo_track: geo_track
end
json.sensors @sensors do |sensor|
  json.partial! 'shared/sensor', sensor: sensor
end