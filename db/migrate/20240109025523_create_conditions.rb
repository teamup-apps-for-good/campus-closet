# frozen_string_literal: true

class CreateConditions < ActiveRecord::Migration[7.1]
  def change
    create_table :conditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
