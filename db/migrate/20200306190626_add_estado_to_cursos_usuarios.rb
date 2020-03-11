class AddEstadoToCursosUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :cursos_usuarios, :estado, :boolean
  end
end
