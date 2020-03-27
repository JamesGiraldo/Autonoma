# frozen_string_literal: true

class Lineas::CursosUsuariosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_linea
  before_action :set_curso_usuario
  before_action :set_curso_usuario, only: %i[edit update asignar]

  def index
    @cursos_usuarios = @linea.cursosUsuario.order(id: :desc).page params[:page]
    if params[:q].present?
      @cursos_usuarios = @cursos_usuarios.where('nombre like :q', q: "%#{params[:q]}%").page params[:page]
    end
  end

  private

  def set_curso_usuario
    @curso = @linea.cursos_usuarios.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_cursos_usuarios_path(@linea, @curso)
    flash[:alert] = 'Este Curso No Existe'
  end

  def set_linea
    @linea = Linea.find(params[:linea_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_cursos_usuarios_path(@linea, @curso_usuario)
    flash[:alert] = 'Este Curso No Existe'
  end

  def curso_usuario_params
    params.require(:cursos_usuario).permit(:nombre, :descripcion, :linea_id)
  end
end
