# frozen_string_literal: true

class AddUserToCursosUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_reference(:cursos_usuarios, :user, foreign_key: true)
  end
end
