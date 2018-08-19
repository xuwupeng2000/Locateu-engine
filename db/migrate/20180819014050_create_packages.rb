class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name, index: true
      t.string :category, index: true
      t.string :logo
      t.string :web_url
      t.string :phone

      t.timestamps
    end
  end
end
