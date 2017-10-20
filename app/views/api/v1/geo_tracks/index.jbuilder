json.geo_tracks @geo_track do |geo|
  json.partial! 'shared/geo_track', geo_track: geo
end