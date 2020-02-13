class LineasController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @lineas = Linea.all
    if params[:q].present?
      @lineas = @lineas.where("nombre ilike :q", q: "%#{params[:q]}%")
    end
  end

  def new
    @linea = Linea.new
  end

  def show
    @linea = Linea.find(params[:id])
  end

  def edit
    @linea = Linea.find(params[:id])
  end

  #PUT /linea/:id
  def update
      @linea = Linea.find_by id: params[:id]
      if @linea.update(linea_params)
        flash[:success]="Linea Actualizada!"
        render :show
      else
        flash[:alert] = "Problemas con la grabación!"
        render :edit
      end
  end

  def destroy
      @linea = Linea.find(params[:id])
      flash[:alert]="Linea Eliminada!"
      @linea.destroy
      redirect_to :action => :index
  end

  def create
         @linea = Linea.new(linea_params)
      if @linea.save!
        flash[:success]="Linea Registrada!"
        render :show
      else
        flash[:alert]="Problemas con la grabación!"
        render :new
      end
  end

  private
  def linea_params
    params.require(:linea).permit(:nombre, :avatar)
  end
end
