# frozen_string_literal: true

class CreateSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :sizes do |t|
      t.string :name

      t.timestamps
    end
  end
end
