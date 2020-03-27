# frozen_string_literal: true

class CreateFacultades < ActiveRecord::Migration[5.1]
  def change
    create_table :facultades do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
