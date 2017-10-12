class CreatePermissionTransitions < ActiveRecord::Migration[5.1]
  def change
    create_table :permission_transitions do |t|
      t.string :to_state, null: false
      t.jsonb :metadata, default: {}
      t.integer :sort_key, null: false
      t.integer :permisson_id, null: false
      t.boolean :most_recent, null: false
      t.timestamps null: false
    end

    add_index(:permission_transitions, [:permisson_id, :sort_key], unique: true, name: "index_permission_transitions_parent_sort")
    add_index(:permission_transitions, [:permisson_id, :most_recent], unique: true, where: 'most_recent', name: "index_permission_transitions_parent_most_recent")
  end
end
