class Programa < ApplicationRecord
  belongs_to :facultad
  has_many :users
end
