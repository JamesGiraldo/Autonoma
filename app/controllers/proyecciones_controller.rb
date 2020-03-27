class ProyeccionesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  respond_to :html, :json

  def index
    @proyecciones = Proyeccion.where(user_id: current_user.id).page params[:page]
    if params[:q].present?
      @proyecciones = @proyecciones.where('nombre like :q or descripcion ilike :q', q: "%#{params[:q]}%").page params[:page]
    end
  end

  def new
    @proyeccion = Proyeccion.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def show
    @proyeccion = Proyeccion.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_path
    flash[:alert] = 'Este Proyeccion No Existe'
  end

  def edit
    @proyeccion = Proyeccion.find(params[:id])
    respond_to do |f|
      f.html
      f.js
    end
  end

  # PUT /proyeccion/:id
  def update
    @proyeccion = Proyeccion.find_by id: params[:id]
    respond_to do |format|
      if @proyeccion.update(proyeccion_params)
        flash[:success] = 'Proyeccion Actualizada!'
        format.html { redirect_to @proyeccion }
        format.json { render :index, status: :created, location: @proyecciones }
        format.js
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        format.html { render :show }
        format.json { render json: @proyeccion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @proyeccion = Proyeccion.find(params[:id])
    if @proyeccion.destroy
      flash[:alert] = 'Proyeccion Eliminada!'
      redirect_to action: :index
    else
      flash[:info] = 'No Puede Eliminar Esta Proyeccion Por Que Contiene Cursos Relacionados!'
      redirect_to action: :index
    end
  end

  def create
    @proyeccion = current_user.proyecciones.new(proyeccion_params)
    respond_to do |format|
      if @proyeccion.save!
        flash[:success] = 'Proyeccion Registrada!'
        format.html { redirect_to @proyeccion }
        format.json { render :index, status: :created, location: @proyeccion }
        format.js
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        format.html { render :show }
        format.json { render json: @proyeccion.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def proyeccion_params
    params.require(:proyeccion).permit(:nombre, :descripcion)
  end
end
