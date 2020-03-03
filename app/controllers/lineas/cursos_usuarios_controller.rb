class Lineas::CursosUsuariosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_linea
  before_action :set_curso_usuario
  before_action :set_curso_usuario, only: [:edit, :update, :asignar]

  def index
      @cursos_usuarios = @linea.cursosUsuario.order(id: :desc)
    if params[:q].present?
      @cursos_usuarios = @cursos_usuarios.where("nombre like :q", q: "%#{params[:q]}%").page params[:page]
    end
  end

  private
  def set_curso_usuario
    begin
      @curso = @linea.cursos_usuarios.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to linea_cursos_usuarios_path(@linea, @curso)
      flash[:alert] = "Este Curso No Existe"
    end
  end

  def set_linea
    begin
      @linea = Linea.find(params[:linea_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to linea_cursos_usuarios_path(@linea, @curso_usuario)
      flash[:alert] = "Este Curso No Existe"
    end
  end

  def curso_usuario_params
    params.require(:cursos_usuario).permit(:nombre, :descripcion, :linea_id)
  end
end