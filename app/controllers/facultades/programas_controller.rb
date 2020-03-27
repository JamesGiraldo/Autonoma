# frozen_string_literal: true

class Facultades::ProgramasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_facultad
  before_action :set_programa
  before_action :set_programa, only: %i[edit update asignar]

  def index
    @programas = @facultad.programas.order(id: :desc).page params[:page]
    if params[:q].present?
      @programas = @programas.where('nombre like :q', q: "%#{params[:q]}%").page params[:page]
    end
  end

  private

  def set_programa
    @programa = @facultad.programas.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to facultad_programas_path(@facultad, @programa)
    flash[:alert] = 'Este Programa No Existe'
  end

  def set_facultad
    @facultad = Facultad.find(params[:facultad_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to facultad_programas_usuarios_path(@facultad, @programa)
    flash[:alert] = 'Este Programa No Existe'
  end

  def programa_usuario_params
    params.require(:programas_usuario).permit(:nombre, :descripcion, :facultad_id)
  end
end
