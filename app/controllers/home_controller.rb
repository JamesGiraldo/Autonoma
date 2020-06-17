class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.documento.present? && current_user.telefono.present? &&
       current_user.nombre.present? && current_user.apellido.present? &&
       current_user.perfil.present? && current_user.direccion.present?
    else
      flash[:info] = 'Sugerencia Asegurese De Actualizar Su datos!'
    end
    @lineas = Linea.includes(:cursos).collect{|linea| [linea.nombre,
                                                      linea.cursos.size]}       
  end
end
