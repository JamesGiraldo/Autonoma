# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddRemoveEstadoToCursos < ActiveRecord::Migration[5.1]
  def change
    remove_column :cursos, :estado
    add_column :cursos_usuarios, :fecha_fin, :date
    add_column :cursos_usuarios, :fecha_inicio, :date
    add_reference(:cursos_usuarios, :curso, foreign_key: true)
    add_column :cursos, :estado, :boolean, default: true
  end
end
# rubocop:enable Style/Documentation
