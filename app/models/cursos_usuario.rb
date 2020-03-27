# frozen_string_literal: true

class CursosUsuario < ApplicationRecord
  belongs_to :linea
  belongs_to :user
end
