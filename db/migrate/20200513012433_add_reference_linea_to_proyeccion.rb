class AddReferenceLineaToProyeccion < ActiveRecord::Migration[5.1]
  def change
    add_reference(:proyecciones, :linea, foreign_key: true)
  end
end
