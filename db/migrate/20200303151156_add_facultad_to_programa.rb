# frozen_string_literal: true

class AddFacultadToPrograma < ActiveRecord::Migration[5.1]
  def change
    add_reference(:programas, :facultad, foreign_key: true)
  end
end
