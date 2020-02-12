class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :cambiar_password, :update_password, :update]
  # before_action :tipo_documento_id

  def index
    if current_user.has_role? :Admin
      @users = User.all.includes(:roles).where('roles.name' => "Docente")
      if params[:q].present?
        @users = @users.where("email ilike :q", q: "%#{params[:q]}%")
      end
    end
  end

  def show
  @user = User.find(params[:id])
  end

  def edit
  end

  def cambiar_password
  end

  def update_password
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      flash[:success] ="Contraseña Actualizada"
      redirect_to "/"
    else
      flash[:alert]="Error al Actualizar"
      render "edit"
    end
  end

  def update
    if current_user.update(user_params)
      flash[:success]="Registro Actualizado"
      redirect_to edit_user_path
    else
      flash[:alert]="Error al Actualizar"
      render :edit
    end
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :current_password,
                                 :password_confirmation,
                                 :nombre,
                                 :apellido,
                                 :telefono,
                                 :direccion,
                                 :documento,
                                 :descripcion,
                                 :perfil)
  end
end