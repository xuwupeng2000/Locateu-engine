class CreateUserPackages < ActiveRecord::Migration[5.1]
  def change
    change_table(:packages) do |t|
      t.remove :user_id
    end

    create_table :user_packages do |t|
      t.references :user
      t.references :package
    end
  end
end
