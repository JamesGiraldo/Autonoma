# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddAvatarToLineas < ActiveRecord::Migration[5.1]
  def change
    add_column :lineas, :avatar, :string
  end
end
# rubocop:enable Style/Documentation
