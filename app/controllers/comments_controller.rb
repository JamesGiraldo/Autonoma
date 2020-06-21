class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:update, :destroy, :create, :edit]
  before_action :authenticate_user!
  # GET /comments
  # GET /comments.json
  def index
    redirect_to root_path
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @user.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.user, notice: "Comentario Registrado Correctamente!"}
        format.json { render :show, status: :created, location: @comment.user }
      else
        format.html { redirect_to @comment.user, alert: "Problemas Con La Grabacion" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.user, notice: "Comentario Actualizado Correctamente" }
        format.json { render :show, status: :ok, location: @comment.user }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @user, alert: "Comentario Eliminado" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      begin
        @comment = Comment.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: "Este Comentario No Existe!"
      end
    end

    def set_user
      begin
        @user = User.find(params[:user_id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: "Este Usuario No Existe!"
      end
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :body)
    end
end
