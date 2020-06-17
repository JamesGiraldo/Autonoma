class CursosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  respond_to :html, :json
  before_action :set_curso, only: [:show, :edit, :update, :destroy]

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
    respond_to do |f|
      f.html
      f.js
    end
  end

  def update
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
    if @curso.destroy
       flash[:alert] = 'Curso Eliminado!'
       redirect_to action: :index
    end
    rescue ActiveRecord::RecordNotFound
      redirect_to cursos_path
      flash[:alert] = 'Este Curso No Existe'
  end

  private

  def set_curso
    @curso = Curso.find(params[:id])
  end

  def curso_params
    params.require(:curso).permit(:nombre, :linea_id, :estado)
  end
end
