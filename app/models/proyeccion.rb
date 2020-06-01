class Proyeccion < ApplicationRecord
  belongs_to :user
  belongs_to :linea
  validates :nombre, presence: true
  validates :descripcion, presence: true
end
