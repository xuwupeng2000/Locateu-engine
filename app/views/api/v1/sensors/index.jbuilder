json.sensors @sensor do |sensor|
  json.partial! 'shared/sensor', sensor: sensor
end