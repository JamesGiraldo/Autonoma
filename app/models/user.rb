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
  has_many :comments
  validates :username, :presence => true, :uniqueness => {
                                          :case_sensitive => false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

  validates :email, presence: true
  validates :email, uniqueness: true

  # def self.find_dor_database_authentication warden_condition
  #   conditions = warden_condition.dup
  #   login = conditions.delete(:login)
  #   where(conditions).where(
  #     ["lower(username) = :value OR lower(email) = :value",
  #     { value: login.strip.downcase }]).first
  # end

  def self.find_for_authentication(conditions)
    if login = conditions.delete(:login)
     where(conditions.to_h).where(['username = :value OR email = :value', { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
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
