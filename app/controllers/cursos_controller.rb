class CursosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_role_user, except: [:index , :show]

  def index
    @cursos = Curso.all
    if params[:q].present?
      @cursos = @cursos.where("nombre ilike :q", q: "%#{params[:q]}%")
    end
  end

  def new
    @curso = Curso.new
  end

  def show
    @curso = Curso.find(params[:id])
  end

  def edit
    @curso = Curso.find(params[:id])
  end

  #PUT /curso/:id
  def update
    if @user.has_role? :Admin
      @curso = Curso.find_by id: params[:id]
      if @curso.update(curso_params)
        flash[:success]="Curso Actualizado!"
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
      @curso = Curso.find(params[:id])
      flash[:alert]="Curso Eliminado!"
      @curso.destroy
      redirect_to :action => :index
    end
  end

  def create
    if @user.has_role? :Admin
         @curso = Curso.new(curso_params)
      if @curso.save!
        flash[:success]="Curso Registrado!"
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
  def curso_params
    params.require(:curso).permit(:nombre)
  end

  def authenticate_role_user
    @user = User.find(current_user.id)
    if @user.has_role? :Admin
    else
      flash[:info]="No tiene permisos para acceder a esa vista!"
      redirect_to cursos_path(@curso)
    end
  end
end
