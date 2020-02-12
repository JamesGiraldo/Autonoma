class LineasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_role_user, except: [:index , :show]

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
    if @user.has_role? :Admin
      @linea = Linea.find_by id: params[:id]
      if @linea.update(linea_params)
        flash[:success]="Linea Actualizada!"
        render :show
      else
        flash[:alert] = "Problemas con la grabación!"
        render :edit
      end
    else
      flash[:info]="No tiene permisos para acceder a esa vista!"
      render :edit
    end
  end

  def destroy
    if @user.has_role? :Admin
      @linea = Linea.find(params[:id])
      flash[:alert]="Linea Eliminada!"
      @linea.destroy
      redirect_to :action => :index
    end
  end

  def create
    if @user.has_role? :Admin
         @linea = Linea.new(linea_params)
      if @linea.save!
        flash[:success]="Linea Registrada!"
        render :show
      else
        flash[:alert]="Problemas con la grabación!"
        render :new
      end
    else
      flash[:info]="No tiene permisos para acceder a esa vista!"
      render :index
    end
  end

  private
  def linea_params
    params.require(:linea).permit(:nombre)
  end

  def authenticate_role_user
    @user = User.find(current_user.id)
    if @user.has_role? :Admin
    else
      flash[:info]="No tiene permisos para acceder a esa vista!"
      redirect_to lineas_path(@linea)
    end
  end
end
