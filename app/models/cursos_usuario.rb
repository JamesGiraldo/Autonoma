# frozen_string_literal: true

class CursosUsuario < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :linea
  belongs_to :user
end
