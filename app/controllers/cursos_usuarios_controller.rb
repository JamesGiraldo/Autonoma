class CursosUsuariosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  respond_to :html, :json
  before_action :set_cursos_usuario,  only: [:show, :edit, :update, :destroy]
  def index
    @cursosUsuarios = CursosUsuario.all.where(user_id: current_user.id).page params[:page]
    if params[:q].present?
      @cursosUsuarios = @cursosUsuarios.where('nombre like :q',
                                        q: "%#{params[:q]}%").page params[:page]
    end
  end

  def show
  rescue ActiveRecord::RecordNotFound
    redirect_to cursos_usuarios_path
    flash[:alert] = 'Este Curso No Existe'
  end

  def new
    @curso_usuario = CursosUsuario.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def edit
    respond_to do |f|
      f.html
      f.js
    end
  end

  def update
    if @curso_usuario.update(curso_usuario_params)
      flash[:success] = 'Curso Actualizado!'
      redirect_to action: :index
    else
      flash[:alert] = 'Problemas Con La Grabacion'
      redirect_to action: :index
    end
  end

  def create
    @curso_usuario = current_user.cursosUsuario.new(curso_usuario_params)
    if @curso_usuario.save!
      flash[:success] = 'Curso Registrado!'
      redirect_to action: :index
    else
      flash[:alert] = 'Problemas Con La Grabacion'
      redirect_to action: :index
    end
  end

  def destroy
    flash[:alert] = 'Curso Eliminado!'
    @curso_usuario.destroy
    redirect_to action: :index
  end

  private

  def set_cursos_usuario
    @curso_usuario = CursosUsuario.find(params[:id])
  end
  def curso_usuario_params
    params.require(:cursos_usuario).permit(:nombre, :descripcion, :linea_id,
                                           :estado, :fecha_inicio, :fecha_fin)
  end
end
