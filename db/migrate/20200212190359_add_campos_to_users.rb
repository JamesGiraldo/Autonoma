# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddCamposToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :telefono, :bigint
    add_column :users, :direccion, :string
    add_column :users, :documento, :bigint
    add_column :users, :descripcion, :string
    add_column :users, :perfil, :string
  end
end
# rubocop:enable Style/Documentation
