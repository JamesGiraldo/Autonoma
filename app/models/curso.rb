# frozen_string_literal: true

class Curso < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :linea
  validates :nombre, presence: true, uniqueness: true
  validates :linea, presence: true
end
