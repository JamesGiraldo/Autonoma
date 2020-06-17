class Linea < ApplicationRecord
  mount_uploader :avatar, PerfilUploader
  has_many :cursos, dependent: :restrict_with_error
  has_many :cursosUsuario, dependent: :restrict_with_error
  validates :nombre, presence: true
  has_many :proyecciones, dependent: :restrict_with_error
end
