FactoryGirl.define do
  factory :geo_track do
    sensor
    lnglat {
      lat = rand(36.848461...36.948461)
      lng = rand(174.763336...174.963336)
      "Point(#{lng} -#{lat})"}
  end
end
