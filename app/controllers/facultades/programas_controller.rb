module Facultades
    class ProgramasController < ApplicationController
      respond_to :html
      before_action :set_facultad
      before_action :set_programa, only: [:show, :edit, :update, :destroy]

      def index
        @programas = @facultad.programas.order(id: :desc).page params[:page]
        if params[:q].present?
          @programas = @programas.where('nombre like :q', q: "%#{params[:q]}%").page params[:page]
        end
      end

      def new
        @programa = @facultad.programas.new
      end

      def show
      end

      def edit
      end

      def create
        @programa = @facultad.programas.new(programa_params)
        if @programa.save
          flash[:success] = "Programa Registrado correctamente!"
          redirect_to action: :index
        else
          flash[:alert] = "Problemas Con La Grabacion!"
          render :new
        end
      end

      def update
        if @programa.update(programa_params)
          flash[:success] = "Programa Actualizado correctamente!"
          redirect_to action: :index
        else
          flash[:alert] = "Problemas Con La Grabacion!"
          render :edit
        end
      end

      def destroy      
        if @programa.destroy
          flash[:alert] = "Programa #{@programa.nombre.upcase} Eliminada!"
          redirect_to action: :index
        end
      end

      private

      def set_facultad
        @facultad = Facultad.find(params[:facultad_id])
      end

      def set_programa
        @programa = @facultad.programas.find(params[:id])
      end

      def programa_params
        params.require(:programa).permit(:nombre)
      end

    end
end
