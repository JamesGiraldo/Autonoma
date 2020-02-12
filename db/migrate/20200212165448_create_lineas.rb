class CreateLineas < ActiveRecord::Migration[5.1]
  def change
    create_table :lineas do |t|
      t.string :nombre
      
      t.timestamps
    end
  end
end
