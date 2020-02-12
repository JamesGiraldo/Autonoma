class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role? :Admin
    else
      flash[:info]="Sugerencia Asegurese De Actualizar Su datos!"
    end
  end
end
