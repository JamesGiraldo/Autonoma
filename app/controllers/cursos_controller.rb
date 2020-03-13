class CursosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  respond_to :html, :json

  def index
    if current_user.has_role? :Admin
       flash[:info]="Si Decea Registrar Un Nuevo Curso Asegurese De Que Tenga Una Linea Su Curso!"
    end
    @cursos = Curso.all.where(estado: true).page params[:page]
    if params[:q].present?
      @cursos = @cursos.where("nombre like :q", q: "%#{params[:q]}%").page params[:page]
    end
  end

  def show
    begin
      @curso = Curso.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to cursos_path
      flash[:alert] = "Este Curso No Existe"
    end
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

  #PUT /curso/:id
  def update
    @curso = Curso.find(params[:id])
      respond_to do |format|
        if @curso.update(curso_params)
          flash[:success]="Curso Actualizado!"
          format.html {redirect_to cursos_path}
          format.json {render :index, status: :created, location: @cursos }
          format.js
        else
          flash[:alert]="Problemas Con La Grabacion"
          format.html {render :show}
          format.json {render json: @curso.errors, status: :unprocessable_entity}
        end
      end
  end

  def create
      @curso = Curso.new(curso_params)
      respond_to do |format|
        if @curso.save
          flash[:success]="Curso Registrado!"
          format.html {redirect_to @curso}
          format.json {render :index, status: :created, location: @curso }
          format.js
        else
          flash[:alert]="Problemas Con La Grabacion"
          format.html {render :show}
          format.json {render json: @curso.errors, status: :unprocessable_entity}
        end
      end
  end

  def destroy
    begin
      @curso = Curso.find(params[:id])
      @curso = Curso.find(params[:id])
      flash[:alert]="Curso Eliminado!"
      @curso.destroy
      redirect_to :action => :index
    rescue ActiveRecord::RecordNotFound
      redirect_to cursos_path
      flash[:alert] = "Este Curso No Existe"
    end
  end

  private
  def curso_params
    params.require(:curso).permit(:nombre, :linea_id, :estado)
  end
end
