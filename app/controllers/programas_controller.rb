class ProgramasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_role_user
  respond_to :html, :json
  before_action :set_programa, only: [ :show, :edit, :update, :destroy]

  def index
    @programas = Programa.all.page params[:page]
    if params[:q].present? # rubocop:todo Style/GuardClause
      @programas = @programas.where('nombre like :q',
                                    q: "%#{params[:q]}%").page params[:page]
    end
  end

  def new
    @programa = Programa.new
  end

  def show
    redirect_to programas_path
  rescue ActiveRecord::RecordNotFound
    redirect_to linea_path
    flash[:alert] = 'Este Programa No Existe'
  end

  def edit
  end

  # PUT /programa/:id
  def update
    if @user.has_role? :Admin
      if @programa.update(programa_params)
        flash[:success] = 'Programa Actualizada!'
        redirect_to action: :index
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        redirect_to action: :index
      end
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      render :edit
    end
  end

  def destroy
    if @user.has_role? :Admin
      if @programa.destroy
        flash[:alert] = "Programa #{@programa.nombre.upcase} Eliminada!"
        redirect_to action: :index
      end
    end
  end

  def create
    if @user.has_role? :Admin
      @programa = Programa.new(programa_params)
      if @programa.save
        flash[:success] = 'Programa Registrada!'
        redirect_to action: :index
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        redirect_to action: :index
      end
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      render :index
    end
  end

  private

  def set_programa
      @programa = Programa.find(params[:id])
  end

  def programa_params
    params.require(:programa).permit(:nombre, :facultad_id)
  end

  def authenticate_role_user
    @user = User.find(current_user.id)
    if @user.has_role? :Admin
    else
      flash[:info] = 'No tiene permisos para acceder a esa vista!'
      redirect_to root_path
    end
  end
end
