class LineasController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
      @lineas = Linea.all.page params[:page]
      if params[:q].present?
        @lineas = @lineas.where("nombre like :q", q: "%#{params[:q]}%").page params[:page]
      end
    end

    def show
      begin
        @linea = Linea.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to linea_path
        flash[:alert] = "Este linea No Existe"
      end
    end

    def new
      @linea = Linea.new
    end

    def edit
      @linea = Linea.find(params[:id])
    end

    def update
        @linea = Linea.find(params[:id])
        if @linea.update(linea_params)
          flash[:success]="Linea actualizado"
          redirect_to lineas_path (@linea)
        else
          flash[:alert]="Error al actualizar"
          render :edit
        end
    end

    def create
      @linea = Linea.new(linea_params)
      if @linea.save!
        flash[:success] = "Linea registrado correctamente"
        redirect_to lineas_path(@linea)
      else
        flash[:alert] = "Problemas con la grabación"
        render :new
      end
    end
    def destroy
        @linea = Linea.find(params[:id])
        flash[:info]="No Puede Eliminar Esta Linea Por Que Contiene Cursos Relacionados!"
        @linea.destroy
        redirect_to :action => :index
    end

    private
    def linea_params
      params.require(:linea).permit(:nombre)
    end

end
