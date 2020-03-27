# frozen_string_literal: true

# rubocop:todo Style/Documentation
class ProgramasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_role_user, except: %i[index show]
  respond_to :html, :json
  def index
    @programas = Programa.all.page params[:page]
    if params[:q].present? # rubocop:todo Style/GuardClause
      @programas = @programas.where('nombre like :q',
                                    q: "%#{params[:q]}%").page params[:page]
    end
  end

  def new
    @programa = Programa.new
  end

  def show
    @programa = Programa.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_path
    flash[:alert] = 'Este Programa No Existe'
  end

  def edit
    @programa = Programa.find(params[:id])
  end

  # PUT /programa/:id
  def update
    if @user.has_role? :Admin
      @programa = Programa.find_by id: params[:id]
      if @programa.update(programa_params)
        flash[:success] = 'Programa Actualizada!'
        redirect_to action: :index
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        redirect_to action: :index
      end
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      render :edit
    end
  end

  def destroy
    if @user.has_role? :Admin
      @programa = Programa.find(params[:id])
      flash[:alert] = 'Programa Eliminada!'
      @programa.destroy
      redirect_to action: :index
    end
  end

  def create
    if @user.has_role? :Admin
      @programa = Programa.new(programa_params)
      if @programa.save
        flash[:success] = 'Programa Registrada!'
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

  private

  def programa_params
    params.require(:programa).permit(:nombre, :facultad_id)
  end

  def authenticate_role_user
    @user = User.find(current_user.id)
    if @user.has_role? :Admin
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      redirect_to programas_path(@programa)
    end
  end
end
