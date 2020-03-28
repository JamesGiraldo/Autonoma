module Lineas
  class CursosController < ApplicationController
    before_action :authenticate_user!
    respond_to :html, :json
    before_action :set_linea    
    before_action :set_curso, only: [:show, :edit, :update, :destroy]

    def index
      @cursos = @linea.cursos.order(id: :desc).page params[:page]
      if params[:q].present?
        @cursos = @cursos.where('nombre like :q', q: "%#{params[:q]}%").page params[:page]
      end
    end

    def edit
      respond_to do |f|
        f.html
        f.js
      end
    end

    def new
      @curso = @linea.cursos.new
      respond_to do |f|
        f.html
        f.js
      end
    end

    def create
      @curso = @linea.cursos.new(curso_params)
      if @curso.save
        flash[:success] = 'Curso Registrado!'
        redirect_to action: :index
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        redirect_to action: :index
      end
    end

    def update
      if @curso.update(curso_params)
        flash[:success] = 'Curso Registrada'
        redirect_to action: :index
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        redirect_to action: :index
      end
    end

    def destroy
      @curso.destroy
      flash[:alert] = 'Curso Eliminado'
      respond_with @linea, :cursos
    end

    private

    def set_linea
      @linea = Linea.find(params[:linea_id])
    end

    def set_curso
      @curso = @linea.cursos.find(params[:id])
    end

    def curso_params
      params.require(:curso).permit(:nombre, :linea_id, :estado)
    end

  end
end
