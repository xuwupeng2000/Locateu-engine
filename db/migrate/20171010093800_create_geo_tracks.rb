class CreateGeoTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :geo_tracks do |t|

      t.timestamps
    end
  end
end
