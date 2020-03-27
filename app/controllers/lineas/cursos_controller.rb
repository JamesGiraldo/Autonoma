# frozen_string_literal: true

class Lineas::CursosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_linea
  before_action :set_curso
  before_action :set_curso, only: %i[edit update asignar]

  def index
    @cursos = @linea.cursos.order(id: :desc).page params[:page]
    if params[:q].present?
      @cursos = @cursos.where('nombre like :q', q: "%#{params[:q]}%").page params[:page]
    end
  end

  private

  def set_curso
    @curso = @linea.cursos.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_cursos_path(@linea, @curso)
    flash[:alert] = 'Este Curso No Existe'
  end

  def set_linea
    @linea = Linea.find(params[:linea_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_cursos_path(@linea, @curso)
    flash[:alert] = 'Este Curso No Existe'
  end

  def curso_params
    params.require(:curso).permit(:nombre, :estado, :linea_id)
  end
end
