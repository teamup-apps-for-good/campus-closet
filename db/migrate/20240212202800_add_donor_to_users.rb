class AddDonorToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :donor, :boolean
  end
end
