# frozen_string_literal: true

class AddAvatarToLineas < ActiveRecord::Migration[5.1]
  def change
    add_column :lineas, :avatar, :string
  end
end
