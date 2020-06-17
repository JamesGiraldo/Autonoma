# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddColumnUserIsToComentario < ActiveRecord::Migration[5.1]
  def change
    add_reference(:comentarios, :user, foreign_key: true)
  end
end
# rubocop:enable Style/Documentation
