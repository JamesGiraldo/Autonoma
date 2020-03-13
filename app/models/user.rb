class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :perfil, PerfilUploader
  has_many :cursosUsuario, :dependent => :restrict_with_error
  has_many :proyecciones, :dependent => :restrict_with_error
  belongs_to :programa
  has_many :comentarios, :dependent => :restrict_with_error
end
