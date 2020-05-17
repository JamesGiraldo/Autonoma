class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    unless current_user.has_role? :Decano or current_user.has_role? :Vicerrector or current_user.has_role? :Director or current_user.has_role? :Docente
        current_user.documento.present? or current_user.telefono.present? or current_user.nombre.present? or current_user.apellido.present? or current_user.perfil.present? or current_user.direccion.present?
        flash[:info] = 'Sugerencia Asegurese De Actualizar Su datos!'
    end
    @lineas = Linea.includes(:cursos).collect{|linea| [linea.nombre,
                                                      linea.cursos.size]}
    @users = User.all.includes(:roles).where('roles.name' => 'Docente').count
  end
end
