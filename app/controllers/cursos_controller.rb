# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CursosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  respond_to :html, :json

  def index
    if current_user.has_role? :Admin
      flash[:info] = 'Si Decea Registrar Un Nuevo Curso Asegurese De Que Tenga Una Linea Su Curso!'
    end
    @cursos = Curso.all.where(estado: true).page params[:page]
    if params[:q].present?
      @cursos = @cursos.where('nombre like :q',
                              q: "%#{params[:q]}%").page params[:page]
    end
  end

  def show
    @curso = Curso.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to cursos_path
    flash[:alert] = 'Este Curso No Existe'
  end

  def new
    @curso = Curso.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def edit
    @curso = Curso.find(params[:id])
    respond_to do |f|
      f.html
      f.js
    end
  end

  def update
    @curso = Curso.find(params[:id])
    if @curso.update(curso_params)
      flash[:success] = 'Curso Actualizado!'
      redirect_to action: :index
    else
      flash[:alert] = 'Problemas Con La Grabacion'
      redirect_to action: :index
    end
  end

  def create
    @curso = Curso.new(curso_params)
    if @curso.save
      flash[:success] = 'Curso Registrado!'
      redirect_to action: :index
    else
      flash[:alert] = 'Problemas Con La Grabacion'
      redirect_to action: :index
    end
  end

  def destroy
    @curso = Curso.find(params[:id])
    flash[:alert] = 'Curso Eliminado!'
    @curso.destroy
    redirect_to action: :index
  rescue ActiveRecord::RecordNotFound
    redirect_to cursos_path
    flash[:alert] = 'Este Curso No Existe'
  end

  private

  def curso_params
    params.require(:curso).permit(:nombre, :linea_id, :estado)
  end
end
