json.sensors @sensors do |sensor|
  json.partial! 'shared/sensor', sensor: sensor
end
