# frozen_string_literal: true

# rubocop:todo Style/Documentation
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters # rubocop:todo Metrics/MethodLength
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
    rescue_from (ActiveRecord::RecordNotFound) { |exception| handle_exception(exception, 404) }

    def catch_404
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end

    protected

    def handle_exception(ex, status)
        render_error(ex, status)
        logger.error ex
    end

    def render_error(ex, status)
        @status_code = status
        respond_to do |format|
          format.html {
            render :file => 'public/404.html', :status => :not_found, :layout => false
            # render :template => "errors/error_404.html.erb", :status => status
          }
          format.all { render :nothing => true, :status => status }
       end
    end
end
# rubocop:enable Style/Documentation
