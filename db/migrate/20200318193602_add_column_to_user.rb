# frozen_string_literal: true

class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
  end
end
