# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CursosUsuariosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index # rubocop:todo Metrics/AbcSize
    # rubocop:todo Naming/VariableName
    @cursosUsuarios = CursosUsuario.all.where(user_id: current_user.id).page params[:page]
    # rubocop:enable Naming/VariableName
    if params[:q].present? # rubocop:todo Style/GuardClause
      # rubocop:todo Naming/VariableName
      @cursosUsuarios = @cursosUsuarios.where('nombre like :q', q: "%#{params[:q]}%").page params[:page]
      # rubocop:enable Naming/VariableName
    end
  end

  def show
    @curso_usuario = CursosUsuario.find(params[:id])
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
    @curso_usuario = CursosUsuario.find(params[:id])
    respond_to do |f|
      f.html
      f.js
    end
  end

  # PUT /curso_usuario/:id
  # rubocop:todo Metrics/MethodLength
  def update # rubocop:todo Metrics/AbcSize
    @curso_usuario = CursosUsuario.find_by id: params[:id]
    respond_to do |format|
      if @curso_usuario.update(curso_usuario_params)
        flash[:success] = 'Curso Actualizado!'
        format.html { redirect_to @curso_usuario }
        format.json { render :index, status: :created, location: @cursosUsuarios }
        format.js
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        format.html { render :show }
        format.json { render json: @curso_usuario.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:todo Metrics/MethodLength
  def create # rubocop:todo Metrics/AbcSize
    @curso_usuario = current_user.cursosUsuario.new(curso_usuario_params)
    respond_to do |format|
      if @curso_usuario.save
        flash[:success] = 'Curso Registrado!'
        format.html { redirect_to @curso_usuario }
        format.json { render :index, status: :created, location: @cursosUsuarios }
        format.js
      else
        flash[:alert] = 'Problemas Con La Grabacion'
        format.html { render :show }
        format.json { render json: @curso_usuario.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def destroy
    @curso_usuario = CursosUsuario.find(params[:id])
    flash[:alert] = 'Curso Eliminado!'
    @curso_usuario.destroy
    redirect_to action: :index
  end

  private

  def curso_usuario_params
    params.require(:cursos_usuario).permit(:nombre, :descripcion, :linea_id, :estado, :fecha_inicio, :fecha_fin)
  end
end
# rubocop:enable Style/Documentation
