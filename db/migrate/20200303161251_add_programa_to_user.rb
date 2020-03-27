# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddProgramaToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference(:users, :programa, foreign_key: true)
  end
end
# rubocop:enable Style/Documentation
