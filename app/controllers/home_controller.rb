class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role? :Admin
    else
      flash[:info]="Sugerencia Asegurese De Actualizar Su datos!"
    end
     #@users = User.all.includes(:roles).where('roles.name' => "Docente").group_by_day(:created_at, format: "%a").count
     # @male_user = Curso.includes(:linea).where(curso.linea_id = curso.id).group_by_week(:created_at).count
     # @female_user = Linea.where(nombre: :ingles).group_by_day(:nombre).count
     @cursos = Curso.all.includes(:linea).group_by_day_of_week(:created_at, format: "%a").count
  end
end
