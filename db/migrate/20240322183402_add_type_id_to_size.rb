class AddTypeIdToSize < ActiveRecord::Migration[7.1]
  def change
    add_reference :sizes, :type, index: true, foreign_key: true
  end
end
