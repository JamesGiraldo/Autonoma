class AddColumnsToCursos < ActiveRecord::Migration[5.1]
  def change
    add_column :cursos, :estado, :boolean
  end
end
