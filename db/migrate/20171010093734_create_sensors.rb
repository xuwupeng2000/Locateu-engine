class CreateSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
    	t.string :serial_code
    	t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
