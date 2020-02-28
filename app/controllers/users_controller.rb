class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :setiar_user, only: [:ver_datos]
  before_action :set_user, only: [:edit, :show ,:cambiar_password, :update_password, :update]

  def index
    if current_user.has_role? :Admin
      @users = User.all.page params[:page]
      if params[:q].present?
        @users = @users.where("email like :q", q: "%#{params[:q]}%").page params[:page]
      end
    end
  end

  def decanos
    if current_user.has_role? :Admin
      @users = User.all.includes(:roles).where('roles.name' => "Decano").page params[:page]
      if params[:q].present?
        @users = @users.where("email like :q", q: "%#{params[:q]}%").page params[:page]
      end
    end
  end

  def index_instructores
    if current_user.has_role? :Admin
      @users = User.all.includes(:roles).where('roles.name' => "Docente").page params[:page]
      if params[:q].present?
        @users = @users.where("email like :q", q: "%#{params[:q]}%").page params[:page]
      end
    elsif current_user.has_role? :Decano
        @users = User.all.includes(:roles).where('roles.name' => "Docente").page params[:page]
      end
  end

  def show
  end

  def ver_datos
    render :template => 'users/show'
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

  def setiar_user
    @user = User.find(params[:id])
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
