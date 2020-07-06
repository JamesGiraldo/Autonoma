class LineasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_role_user, except: %i[index show]
  before_action :set_linea, only: [ :show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @lineas = Linea.all.page params[:page]
    if params[:q].present?
      @lineas = @lineas.where('nombre like :q',
                              q: "%#{params[:q]}%").page params[:page]
    end
  end

  def show
    redirect_to linea_path
    rescue ActiveRecord::RecordNotFound
      redirect_to linea_path
      flash[:alert] = 'Este linea No Existe'
  end

  def new
    @linea = Linea.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def edit
    respond_to do |f|
      f.html
      f.js
    end
  end

  def update
    if @linea.update(linea_params)
      flash[:success] = 'Linea Actualizada!'
      redirect_to action: :index
    else
      flash[:alert] = 'Problemas Con La Grabacion'
      redirect_to action: :index
    end
  end

  def create
    if @user.has_role? :Admin
      @linea = Linea.new(linea_params)
      if @linea.save
        flash[:success] = 'Linea Registrado!'
        redirect_to action: :index
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        redirect_to action: :index
      end
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      render :index
    end
  end

  def destroy
    if @linea.destroy
      flash[:alert] = "Linea #{@linea.nombre.upcase} Eliminada Correctamente!"
      redirect_to action: :index
    else
      flash[:info] = 'No Puede Eliminar Esta Linea Por Que Contiene Cursos Relacionados!'
      redirect_to action: :index
    end
  end

  private

  def set_linea
    @linea = Linea.find(params[:id])
  end

  def linea_params
    params.require(:linea).permit(:nombre, :avatar)
  end

  def authenticate_role_user
    @user = User.find(current_user.id)
    if @user.has_role? :Admin
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      redirect_to lineas_path(@linea)
    end
  end
end
