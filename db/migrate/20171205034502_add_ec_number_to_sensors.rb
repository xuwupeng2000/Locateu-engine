class AddEcNumberToSensors < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :ec_number, :string
  end
end
