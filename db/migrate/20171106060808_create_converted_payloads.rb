class CreateConvertedPayloads < ActiveRecord::Migration[5.1]
  def change
    create_table :converted_payloads do |t|
      t.jsonb :content, default: {}, null: false

      t.timestamps
    end
  end
end
