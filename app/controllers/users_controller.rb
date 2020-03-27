# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :setiar_user, only: [:ver_datos]
  before_action :set_user, only: %i[edit show cambiar_password update_password update]
  respond_to :html, :json

  def index
    if current_user.has_role? :Admin
      @users = User.all.page params[:page]
      if params[:q].present?
        @users = @users.where('email like :q or nombre like :q or apellido like :q or telefono like :q or direccion like :q', q: "%#{params[:q]}%").page params[:page]
      end
    end
  end

  def decanos
    if current_user.has_role? :Admin
      @users = User.all.includes(:roles).where('roles.name' => 'Decano').page params[:page]
      if params[:q].present?
        @users = @users.where('email like :q or nombre like :q or apellido like :q or telefono like :q or direccion like :q', q: "%#{params[:q]}%").page params[:page]
      end
    end
  end

  def index_instructores
    if current_user.has_role? :Admin
      @users = User.all.includes(:roles).where('roles.name' => 'Docente').page params[:page]
      if params[:q].present?
        @users = @users.where('email like :q or nombre like :q or apellido like :q or telefono like :q or direccion like :q', q: "%#{params[:q]}%").page params[:page]
      end
    elsif current_user.has_role? :Decano
      @users = User.all.includes(:roles).where('roles.name' => 'Docente').page params[:page]
    end
  end

  def show; end

  def ver_datos
    render template: 'users/show'
  end

  def edit; end

  def cambiar_password; end

  def update_password
    if current_user.update_with_password(user_params)
      bypass_sign_in(current_user)
      flash[:success] = 'Contraseña Actualizada'
      redirect_to '/'
    else
      flash[:alert] = 'Problemas al Actualizar'
      render 'cambiar_password'
    end
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'Perfil Actualizado'
      redirect_to edit_user_path
    else
      flash[:alert] = 'Problemas al Actualizar Datos'
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'Cerro sesion correctamente'
      redirect_to new_user_registration_path
    else
      flash[:alert] = 'No Puede Salir'
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
    params.require(:user).permit(:email, :password,
                                 :current_password, :password_confirmation,
                                 :nombre, :apellido,
                                 :telefono, :direccion,
                                 :documento, :descripcion,
                                 :perfil)
  end
end
