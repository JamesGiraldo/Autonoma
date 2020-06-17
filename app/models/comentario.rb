class Comentario < ApplicationRecord 
  belongs_to :user
  validates :titulo, presence: true
  validates :descripccion, presence: true
end
