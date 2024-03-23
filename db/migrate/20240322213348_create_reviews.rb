class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :donor, null: false, foreign_key: { to_table: :users }
      t.references :pickup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
