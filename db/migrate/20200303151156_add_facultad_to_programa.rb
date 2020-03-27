# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddFacultadToPrograma < ActiveRecord::Migration[5.1]
  def change
    add_reference(:programas, :facultad, foreign_key: true)
  end
end
# rubocop:enable Style/Documentation
