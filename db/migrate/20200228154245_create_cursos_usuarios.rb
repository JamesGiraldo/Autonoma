class CreateCursosUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :cursos_usuarios do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
    add_reference(:cursos_usuarios, :linea, foreign_key: true)
    add_reference(:users, :cursos_usuarios, foreign_key: true)
    add_reference(:lineas, :cursos_usuarios, foreign_key: true)
  end
end
