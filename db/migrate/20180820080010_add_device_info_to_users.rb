class AddDeviceInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      t.column :serial_code, :string, index: true
    end
  end
end
