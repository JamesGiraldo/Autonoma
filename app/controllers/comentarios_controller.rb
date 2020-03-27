# frozen_string_literal: true

# COnmentarios Controller
class ComentariosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  respond_to :html, :json
  def index
    @comentarios = Comentario.all.where(user_id:
                                        current_user.id).page params[:page]
    if params[:q].present?
      @comentarios = @comentarios.where('titulo like :q',
                                        q: "%#{params[:q]}%").page params[:page]
    end
  end

  def show
    @comentario = Comentario.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to comentario_path
    flash[:alert] = 'Este comentario No Existe'
  end

  def new
    @comentario = Comentario.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def edit
    @comentario = Comentario.find(params[:id])
    respond_to do |f|
      f.html
      f.js
    end
  end

  def update
    @comentario = Comentario.find(params[:id])
    if @comentario.update(comentario_params)
      flash[:success] = 'Comentario Actualizado!'
      redirect_to action: :index
    else
      flash[:alert] = 'Problemas Con La Grabacion'
      redirect_to action: :index
    end
  end

  def create
    @comentario = current_user.comentarios.new(comentario_params)
    if @comentario.save
      flash[:success] = 'Comentario Registrado!'
      redirect_to action: :index
    else
      flash[:alert] = 'Problemas Con La Grabacion'
      redirect_to action: :index
    end
  end

  private

  def comentario_params
    params.require(:comentario).permit(:titulo, :descripccion)
  end
end
