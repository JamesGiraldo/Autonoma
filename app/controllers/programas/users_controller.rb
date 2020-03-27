# frozen_string_literal: true

# rubocop:todo Style/Documentation
class Programas::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_programa
  before_action :set_user
  before_action :set_user, only: %i[edit update asignar]

  def index # rubocop:todo Metrics/AbcSize
    @users = @programa.users.all.includes(:roles).where('roles.name' => 'Docente').order(id: :desc).page params[:page]
    if params[:q].present? # rubocop:todo Style/GuardClause
      @users = @users.where('email like :q or nombre like :q or apellido like :q or telefono like :q or direccion like :q', q: "%#{params[:q]}%").page params[:page]
    end
  end

  private

  def set_user
    @user = @programa.users.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to programa_users_path(@programa, @user)
    flash[:alert] = 'Este Usuario No Se Encuentra en este Programa'
  end

  def set_programa
    @programa = Programa.find(params[:programa_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to programa_users_path(@programa, @user)
    flash[:alert] = 'Este Usuario No Se Encuentra en este Programa'
  end

  def user_params
    params.require(:user).permit(:nombre,
                                 :programa_id,
                                 :email,
                                 :apellido,
                                 :telefono,
                                 :direccion,
                                 :documento,
                                 :descripcion,
                                 :perfil)
  end
end
# rubocop:enable Style/Documentation
