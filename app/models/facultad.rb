# frozen_string_literal: true

class Facultad < ApplicationRecord # rubocop:todo Style/Documentation
  has_many :programas, dependent: :restrict_with_error
  validates :nombre, presence: true
end
