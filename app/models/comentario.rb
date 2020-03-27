# frozen_string_literal: true

class Comentario < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :user
end
