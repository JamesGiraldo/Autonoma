class FacultadesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_role_user, only: [:create, :new, :update, :edit, :destroy]
  before_action :set_facultad, only: [:show, :edit, :update, :destroy]

  def index
    @facultades = Facultad.all.page params[:page]
    if params[:q].present?
      @facultades = @facultades.where('nombre like :q',
                                      q: "%#{params[:q]}%").page params[:page]
    end
  end

  def new
    @facultad = Facultad.new
  end

  def show
    redirect_to facultades_path
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_path
    flash[:alert] = 'Este Facultad No Existe'
  end

  def edit
  end

  # PUT /facultad/:id
  def update
    if @facultad.update(facultad_params)
      flash[:success] = 'Facultad Actualizada!'
      render :show
    else
      flash[:alert] = 'Problemas con la grabación!'
      render :edit
    end
  end

  def destroy
    @facultad.destroy
    flash[:alert] = 'Facultad Eliminada!'
    redirect_to action: :index
  end

  def create
    @facultad = Facultad.new(facultad_params)
    if @facultad.save
      flash[:success] = 'Facultad Registrada!'
      render :show
    else
      flash[:alert] = 'Problemas con la grabación!'
      render :new
    end
  end

  private

  def set_facultad
    @facultad = Facultad.find(params[:id])
  end

  def facultad_params
    params.require(:facultad).permit(:nombre)
  end

  def authenticate_role_user
    @user = User.find(current_user.id)
    if @user.has_role? :Admin
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      redirect_to root_path
    end
  end
end
