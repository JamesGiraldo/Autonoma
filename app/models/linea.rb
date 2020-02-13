class Linea < ApplicationRecord
  mount_uploader :avatar, PerfilUploader
  has_many :cursos
end
