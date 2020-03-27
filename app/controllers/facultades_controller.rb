# frozen_string_literal: true

# rubocop:todo Style/Documentation
class FacultadesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_role_user, except: %i[index show]

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
    @facultad = Facultad.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_path
    flash[:alert] = 'Este Facultad No Existe'
  end

  def edit
    @facultad = Facultad.find(params[:id])
  end

  # PUT /facultad/:id
  def update 
    if @user.has_role? :Admin
      @facultad = Facultad.find_by id: params[:id]
      if @facultad.update(facultad_params)
        flash[:success] = 'Facultad Actualizada!'
        render :show
      else
        flash[:alert] = 'Problemas con la grabación!'
        render :edit
      end
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      render :edit
    end
  end

  def destroy
    if @user.has_role? :Admin # rubocop:todo Style/GuardClause
      @facultad = Facultad.find(params[:id])
      flash[:alert] = 'Facultad Eliminada!'
      @facultad.destroy
      redirect_to action: :index
    end
  end

  def create # rubocop:todo Metrics/MethodLength
    if @user.has_role? :Admin
      @facultad = Facultad.new(facultad_params)
      if @facultad.save!
        flash[:success] = 'Facultad Registrada!'
        render :show
      else
        flash[:alert] = 'Problemas con la grabación!'
        render :new
      end
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      render :index
    end
  end

  private

  def facultad_params
    params.require(:facultad).permit(:nombre)
  end

  def authenticate_role_user
    @user = User.find(current_user.id)
    if @user.has_role? :Admin
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      redirect_to facultads_path(@facultad)
    end
  end
end
# rubocop:enable Style/Documentation
