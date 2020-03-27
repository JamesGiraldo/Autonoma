# frozen_string_literal: true

class Linea < ApplicationRecord # rubocop:todo Style/Documentation
  mount_uploader :avatar, PerfilUploader
  has_many :cursos, dependent: :restrict_with_error
  has_many :cursosUsuario, dependent: :restrict_with_error
  validates :nombre, presence: true
end
