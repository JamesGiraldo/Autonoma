class CursosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    flash[:info]="Si Decea Registrar Un Nuevo Curso Asegurese De Que Tenga Una Linea Su Curso!"
    @cursos = Curso.all.page params[:page]
    if params[:q].present?
      @cursos = @cursos.where("nombre ilike :q", q: "%#{params[:q]}%").page params[:page]
    end
  end

  def new
    @curso = Curso.new
  end

  def show
    @curso = Curso.find(params[:id])
  end

  def edit
    @curso = Curso.find(params[:id])
  end

  #PUT /curso/:id
  def update
      @curso = Curso.find_by id: params[:id]
      if @curso.update(curso_params)
        flash[:success]="Curso Actualizado!"
        render :show
      else
        flash[:alert] = "Problemas con la grabación!"
        render :edit
      end
  end

  def destroy
      @curso = Curso.find(params[:id])
      flash[:alert]="Curso Eliminado!"
      @curso.destroy
      redirect_to :action => :index
  end

  def create
         @curso = Curso.new(curso_params)
      if @curso.save!
        flash[:success]="Curso Registrado!"
        render :show
      else
        flash[:alert]="Problemas con la grabación!"
        render :new
      end
  end

  private
  def curso_params
    params.require(:curso).permit(:nombre, :linea_id)
  end
end
