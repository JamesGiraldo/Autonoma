# frozen_string_literal: true

class Programa < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :facultad
  has_many :users
end
