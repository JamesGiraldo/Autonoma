# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
  end
end
# rubocop:enable Style/Documentation
