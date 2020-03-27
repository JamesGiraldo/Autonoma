# frozen_string_literal: true

class Comentario < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :user
  validates :titulo, presence: true
  validates :descripccion, presence: true
end
