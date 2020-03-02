class CursosUsuariosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @cursosUsuarios = CursosUsuario.all.page params[:page]
    if params[:q].present?
      @cursosUsuarios = @cursosUsuarios.where("nombre like :q", q: "%#{params[:q]}%").page params[:page]
    end
  end

  def show
    begin
      @curso_usuario = CursosUsuario.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to cursos_usuarios_path
      flash[:alert] = "Este Curso No Existe"
    end
  end

  def new
    @curso_usuario = CursosUsuario.new
  end

  def edit
    @curso_usuario = CursosUsuario.find(params[:id])
  end

  #PUT /curso_usuario/:id
  def update
      @curso_usuario = CursosUsuario.find_by id: params[:id]
      if @curso_usuario.update(curso_usuario_params)
        flash[:success]="Curso Actualizado!"
        render :show
      else
        flash[:alert] = "Problemas con la grabación!"
        render :edit
      end
  end

    def create
        @curso_usuario = CursosUsuario.new(curso_usuario_params)
        if @curso_usuario.save
          flash[:success] = "Curso registrado correctamente"
          redirect_to cursos_usuarios_path(@curso_usuario)
        else
          flash[:alert] = "Problemas con la grabación"
          render :new
        end
    end

  def destroy
      @curso_usuario = CursosUsuario.find(params[:id])
      flash[:alert]="Curso Eliminado!"
      @curso_usuario.destroy
      redirect_to :action => :index
  end

  private
  def curso_usuario_params
    params.require(:cursos_usuario).permit(:nombre, :descripcion, :linea_id)
  end
end
