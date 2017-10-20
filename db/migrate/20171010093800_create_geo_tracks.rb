class CreateGeoTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :geo_tracks do |t|
    	t.references :sensor, index: true, null: false
    	t.st_point :lat, geographic: true
		  t.st_point :lng, geographic: true
		  t.jsonb :metadada, default: {}

      t.timestamps
    end

    add_index :geo_tracks, :lat, using: :gist
    add_index :geo_tracks, :lng, using: :gist
  end
end
