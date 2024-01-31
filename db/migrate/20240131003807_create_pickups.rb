class CreatePickups < ActiveRecord::Migration[7.1]
  def change
    create_table :pickups do |t|
      t.references :donator, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
