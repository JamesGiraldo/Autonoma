class Curso < ApplicationRecord
  belongs_to :linea
  validates :nombre, presence: true, uniqueness: true
  validates :linea, presence: true
end
