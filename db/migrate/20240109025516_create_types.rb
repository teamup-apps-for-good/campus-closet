# frozen_string_literal: true

class CreateTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :types do |t|
      t.string :name

      t.timestamps
    end
  end
end
