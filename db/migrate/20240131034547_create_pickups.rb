class CreatePickups < ActiveRecord::Migration[7.1]
  def change
    create_table :pickups do |t|
      t.references :donor, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
