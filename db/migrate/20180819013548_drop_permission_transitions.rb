class DropPermissionTransitions < ActiveRecord::Migration[5.1]
  def change
    drop_table :permission_transitions
    drop_table :permissions
    drop_table :sensors
  end
end
