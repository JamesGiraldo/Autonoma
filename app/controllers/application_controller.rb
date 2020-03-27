# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :username,
               :programa_id, :password,
               :current_password, :password_confirmation,
               :nombre, :apellido,
               :telefono, :direccion,
               :documento, :descripcion)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:login, :password,
               :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password,
               :current_password, :password_confirmation,
               :nombre, :apellido,
               :telefono, :direccion,
               :documento, :descripcion, :perfil)
    end
  end
end
