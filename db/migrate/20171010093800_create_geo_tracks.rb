class CreateGeoTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :geo_tracks do |t|
    	t.references :sensor, index: true, null: false
    	t.st_point :lnglat, geographic: true
		  t.jsonb :metadada, default: {}

      t.timestamps
    end

    add_index :geo_tracks, :lnglat, using: :gist
  end
end
