# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CreateProgramas < ActiveRecord::Migration[5.1]
  def change
    create_table :programas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
