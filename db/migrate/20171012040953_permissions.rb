class Permissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
    	t.references :user, index: true, null: false
    	t.references :ec, index: true, null: false
    	t.string :state, index: true

      t.timestamps
    end
  end
end
