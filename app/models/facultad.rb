# frozen_string_literal: true

class Facultad < ApplicationRecord
  has_many :programas, dependent: :restrict_with_error
end
