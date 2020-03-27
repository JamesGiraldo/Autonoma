# frozen_string_literal: true

class CreateCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :cursos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
