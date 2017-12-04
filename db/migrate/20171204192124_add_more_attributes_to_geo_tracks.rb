class AddMoreAttributesToGeoTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :geo_tracks, :acc, :string
    add_column :geo_tracks, :cmd, :string
    add_column :geo_tracks, :gpstime, :datetime
    add_column :geo_tracks, :systemtime, :datetime
  end
end
