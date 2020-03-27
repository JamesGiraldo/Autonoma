# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :login
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :perfil, PerfilUploader
  has_many :cursosUsuario, dependent: :restrict_with_error
  has_many :proyecciones, dependent: :restrict_with_error
  belongs_to :programa
  has_many :comentarios, dependent: :restrict_with_error
  validates :documento, presence: true , uniqueness: true
  validates :nombre, presence: true
  validates :apellido, presence: true
  # def self.find_dor_database_authentication warden_condition
  #   conditions = warden_condition.dup
  #   login = conditions.delete(:login)
  #   where(conditions).where(
  #     ["lower(username) = :value OR lower(email) = :value",
  #     { value: login.strip.downcase }]).first
  # end

  def self.find_for_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(['username = :value OR email = :value', { value: login }]).first
  end
  # "getter"
  #
  # def login
  #   @login
  # end

  # "setter"
  # def login=(str)
  #    @login = str
  # end
end
