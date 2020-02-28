class ComentariosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @comentarios = Comentario.all.page params[:page]
    if params[:q].present?
      @comentarios = @comentarios.where("titulo like :q", q: "%#{params[:q]}%").page params[:page]
    end
  end

  def show
    begin
      @comentario = Comentario.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to comentario_path
      flash[:alert] = "Este comentario No Existe"
    end
  end

  def new
    @comentario = Comentario.new
  end

  def edit
    @comentario = Comentario.find(params[:id])
  end

  def update
      @comentario = Comentario.find(params[:id])
      if @comentario.update(comentario_params)
        flash[:success]="Comentario actualizado"
        redirect_to comentarios_path (@comentario)
      else
        flash[:alert]="Error al actualizar"
        render :edit
      end
  end

  def create
    @comentario = Comentario.new(comentario_params)
    if @comentario.save!
      flash[:success] = "Comentario registrado correctamente"
      redirect_to comentarios_path(@comentario)
    else
      flash[:alert] = "Problemas con la grabación"
      render :new
    end
  end

  private
  def comentario_params
    params.require(:comentario).permit(:titulo, :descripccion)
  end
end
