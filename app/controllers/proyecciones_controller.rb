class ProyeccionesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @proyecciones = Proyeccion.all.page params[:page]
    if params[:q].present?
      @proyecciones = @proyecciones.where("nombre ilike :q or descripcion ilike :q", q: "%#{params[:q]}%").page params[:page]
    end
  end

  def new
    @proyeccion = Proyeccion.new
  end

  def show
    @proyeccion = Proyeccion.find(params[:id])
  end

  def edit
    @proyeccion = Proyeccion.find(params[:id])
  end

  #PUT /proyeccion/:id
  def update
      @proyeccion = Proyeccion.find_by id: params[:id]
      if @proyeccion.update(proyeccion_params)
        flash[:success]="Proyeccion Actualizada!"
        render :show
      else
        flash[:alert] = "Problemas con la grabación!"
        render :edit
      end
  end

  def destroy
      @proyeccion = Proyeccion.find(params[:id])
    if  @proyeccion.destroy
      flash[:alert]="Proyeccion Eliminada!"
      redirect_to :action => :index
    else
      flash[:info]="No Puede Eliminar Esta Proyeccion Por Que Contiene Cursos Relacionados!"
      redirect_to :action => :index
    end
  end

  def create
         @proyeccion = Proyeccion.new(proyeccion_params)
      if @proyeccion.save!
        flash[:success]="Proyeccion Registrada!"
        render :show
      else
        flash[:alert]="Problemas con la grabación!"
        render :new
      end
  end

  private
  def proyeccion_params
    params.require(:proyeccion).permit(:nombre, :descripcion)
  end
end
