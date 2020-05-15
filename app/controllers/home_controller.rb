class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.has_role? :Admin
    else
      unless current_user.documento.present?
        flash[:info] = 'Sugerencia Asegurese De Actualizar Su datos!'
      end
    end
    @lineas = Linea.includes(:cursos).collect{|linea| [linea.nombre,
                                                      linea.cursos.size]}
    @users = User.all.includes(:roles).where('roles.name' => 'Docente').count
  end
end
