class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :phone
      t.string :address
      t.boolean :student

      t.timestamps
    end
  end
end
