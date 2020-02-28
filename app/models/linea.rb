class Linea < ApplicationRecord
  mount_uploader :avatar, PerfilUploader
  has_many :cursos, :dependent => :restrict_with_error
  has_many :CursosUsuario, :dependent => :restrict_with_error
end
