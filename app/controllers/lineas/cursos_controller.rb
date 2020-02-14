class Lineas::CursosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_linea
  before_action :set_curso, only: [:edit, :update, :asignar]

  def index
    @cursos = @linea.cursos.order(id: :desc)    
  end

  def new
    @curso = @linea.cursos.new
  end

  def edit
  end

  def update
      if @curso.update(curso_params)
        flash[:success]="Curso actualizado"
        redirect_to linea_cursos_path(@linea, @curso)
      else
        flash[:alert]="Error al actualizar"
        render :edit
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
    @curso = @linea.cursos.find(params[:id])
  end

  def set_linea
    @linea = Linea.find(params[:linea_id])
  end

  def curso_params
    params.require(:curso).permit(:codigo, :nombre, :descripcion, :estado, :jornada,
       :centro_id, :horario, :intensidad, :fecha_inicio, :ambiente, :tipo_formacion)
  end
end
