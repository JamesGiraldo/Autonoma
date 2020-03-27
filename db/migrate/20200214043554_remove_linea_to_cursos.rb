# frozen_string_literal: true

class RemoveLineaToCursos < ActiveRecord::Migration[5.1]
  def change
    add_reference(:cursos, :linea, foreign_key: true)
  end
end
