# frozen_string_literal: true

# rubocop:todo Style/Documentation
class ProyeccionesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  respond_to :html, :json

  def index
    @proyecciones = Proyeccion.where(user_id: current_user.id).page params[:page]
    if params[:q].present?
      @proyecciones = @proyecciones.where('nombre like :q or descripcion like :q', q: "%#{params[:q]}%").page params[:page]
    end
  end

  def new
    @proyeccion = Proyeccion.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def show
    @proyeccion = Proyeccion.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_path
    flash[:alert] = 'Este Proyeccion No Existe'
  end

  def edit
    @proyeccion = Proyeccion.find(params[:id])
    respond_to do |f|
      f.html
      f.js
    end
  end

  def update
    @proyeccion = Proyeccion.find_by id: params[:id]
    if @proyeccion.update(proyeccion_params)
      flash[:success] = 'Proyeccion Actualizada!'
      redirect_to action: :index
    else
      flash[:alert] = 'Problemas Con La Grabacion'
      redirect_to action: :index
    end
  end

  def destroy
    @proyeccion = Proyeccion.find(params[:id])
    if @proyeccion.destroy
      flash[:alert] = 'Proyeccion Eliminada!'
      redirect_to action: :index
    else
      flash[:info] = 'No Puede Eliminar Esta Proyeccion Por Que Contiene Cursos Relacionados!'
      redirect_to action: :index
    end
  end

  def create
    @proyeccion = current_user.proyecciones.new(proyeccion_params)
    if @proyeccion.save!
      flash[:success] = 'Proyeccion Registrada!'
      redirect_to action: :index
    else
      flash[:alert] = 'Problemas Con La Grabacion'
      redirect_to action: :index
    end
  end

  private

  def proyeccion_params
    params.require(:proyeccion).permit(:nombre, :linea_id, :descripcion)
  end
end
