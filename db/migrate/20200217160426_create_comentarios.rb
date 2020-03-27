# frozen_string_literal: true

class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.string :titulo
      t.string :descripccion

      t.timestamps
    end
  end
end
