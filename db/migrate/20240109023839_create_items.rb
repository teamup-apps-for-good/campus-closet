class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :color, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true
      t.text :description
      t.references :status, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
