# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddUserToProyeccion < ActiveRecord::Migration[5.1]
  def change
    add_reference(:proyecciones, :user, foreign_key: true)
  end
end
# rubocop:enable Style/Documentation
