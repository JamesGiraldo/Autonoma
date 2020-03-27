# frozen_string_literal: true

class CursosUsuario < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :linea
  belongs_to :user
  validates :nombre, presence: true,  uniqueness: true
  validates :descripcion, presence: true
  validates :linea, presence: true
  validates :fecha_inicio, presence: true
  validates :fecha_fin, presence: true
  validates :estado, presence: true
end
