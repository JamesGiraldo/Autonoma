# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddColumnsToCursos < ActiveRecord::Migration[5.1]
  def change
    add_column :cursos, :estado, :boolean
  end
end
# rubocop:enable Style/Documentation
