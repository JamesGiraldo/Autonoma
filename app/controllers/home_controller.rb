class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role? :Admin
    else
      flash[:info]="Sugerencia Asegurese De Actualizar Su datos!"
    end
     #@male_user = Linea.where(nombre: :pedagogia).group_by_day(:created_at, time_zone:  false).count
     #@female_user = Linea.where(nombre: :ingles).group_by_day(:created_at, time_zone:  false).count
  end
end
