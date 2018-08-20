class AddUserIdToPackages < ActiveRecord::Migration[5.1]
  def change
    change_table(:packages) do |t|
      t.references :user
    end
  end
end
