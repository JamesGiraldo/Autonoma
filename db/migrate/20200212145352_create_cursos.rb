# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CreateCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :cursos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
