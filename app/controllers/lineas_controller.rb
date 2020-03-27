class LineasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  respond_to :html, :json
  def index
    @lineas = Linea.all.page params[:page]
    if params[:q].present?
      @lineas = @lineas.where('nombre like :q', q: "%#{params[:q]}%").page params[:page]
    end
  end

  def show
    @linea = Linea.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_path
    flash[:alert] = 'Este linea No Existe'
  end

  def new
    @linea = Linea.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def edit
    @linea = Linea.find(params[:id])
    respond_to do |f|
      f.html
      f.js
    end
  end

  def update
    @linea = Linea.find(params[:id])
    respond_to do |format|
      if @linea.update(linea_params)
        flash[:success] = 'Linea Actualizada!'
        format.html { redirect_to @linea }
        format.json { render :index, status: :created, location: @lineas }
        format.js
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        format.html { render :show }
        format.json { render json: @linea.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @linea = Linea.new(linea_params)
    respond_to do |format|
      if @linea.save!
        flash[:success] = 'Linea Registrado!'
        format.html { redirect_to @linea }
        format.json { render :index, status: :created, location: @linea }
        format.js
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        format.html { render :show }
        format.json { render json: @linea.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @linea = Linea.find(params[:id])
    flash[:info] = 'No Puede Eliminar Esta Linea Por Que Contiene Cursos Relacionados!'
    @linea.destroy
    redirect_to action: :index
  end

  private

  def linea_params
    params.require(:linea).permit(:nombre)
  end
end
