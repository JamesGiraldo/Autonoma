Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :users, only: [:index, :ver_datos] do
    get :ver_datos, on: :member
    collection do
      get :index_instructores
      get :decanos
    end
  end
  resource :user, only: [:edit, :destroy, :update , :show] do
    collection do
      patch 'update_password'
      get :cambiar_password
    end
  end
  resources :cursos
  resources :lineas, except: [:show] do
    resources :cursos, module: :lineas, except: [:show]
  end
  resources :lineas
  resources :programas
  resources :facultades
  resources :proyecciones
  resources :comentarios
  resources :cursos_usuarios
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
