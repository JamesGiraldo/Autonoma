class Lineas::CursosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_linea
  before_action :set_curso
  before_action :set_curso, only: [:edit, :update, :asignar]

  def index
      @cursos = @linea.cursos.order(id: :desc)
    if params[:q].present?
      @cursos = @cursos.where("nombre like :q", q: "%#{params[:q]}%").page params[:page]
    end
  end

  def show
    @curso = @linea.cursos.page params[:page]
  end

  def new
    @curso = @linea.cursos.new
  end

  def edit
  end

  def asignar
    unless current_user.cursos.include? @curso
      @curso.users << current_user
      if @curso.save
        flash[:success]="Inscripcion realizada correctamente"
        redirect_to linea_cursos_path(@linea)
      else
        flash[:alert]="Error al realizar inscripcion"
        redirect_to linea_cursos_path(@linea)
      end
    else
      flash[:alert]="Usted ya se encuentra inscrito al curso"
      redirect_to linea_cursos_path(@linea)
    end
  end

  def update
    if @user.has_role? :admin
      if @curso.update(curso_params)
        flash[:success]="Curso actualizado"
        redirect_to linea_cursos_path(@linea, @curso)
      else
        flash[:alert]="Error al actualizar"
        render :edit
      end
    else
      flash[:alert]="No tiene permisos para acceder a esa vista"
      render :index
    end
  end

  def create
    @curso = @linea.cursos.new(curso_params)
    if @curso.save
      flash[:success] = "Curso registrado correctamente"
      redirect_to linea_cursos_path(@linea, @curso)
    else
      flash[:alert] = "Problemas con la grabación"
      render :new
    end
  end

  private
  def set_curso
    begin
      @curso = @linea.cursos.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to linea_cursos_path(@linea, @curso)
      flash[:alert] = "Este Curso No Existe"
    end
  end

  def set_linea
    begin
      @linea = Linea.find(params[:linea_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to linea_cursos_path(@linea, @curso)
      flash[:alert] = "Este Curso No Existe"
    end
  end

  def curso_params
    params.require(:curso).permit(:nombre, :estado, :linea_id)
  end
end
