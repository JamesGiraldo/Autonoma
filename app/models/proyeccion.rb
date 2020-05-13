# frozen_string_literal: true

class Proyeccion < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :user
  belongs_to :linea
  validates :nombre, presence: true
  validates :descripcion, presence: true
end
