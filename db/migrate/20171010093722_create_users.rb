class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :username, null: false
      t.string :password_digest, null: false
    	t.string :email
    	t.string :profile_digest

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email
  end
end
