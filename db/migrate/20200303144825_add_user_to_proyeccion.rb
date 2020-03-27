# frozen_string_literal: true

class AddUserToProyeccion < ActiveRecord::Migration[5.1]
  def change
    add_reference(:proyecciones, :user, foreign_key: true)
  end
end
