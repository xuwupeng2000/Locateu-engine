class AddProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      t.column :name, :string, index: true
      t.column :ec1, :string
      t.column :ec2, :string
      t.remove :profile_digest
    end
  end
end
