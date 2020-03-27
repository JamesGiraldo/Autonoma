# frozen_string_literal: true

class Programa < ApplicationRecord
  belongs_to :facultad
  has_many :users
end
