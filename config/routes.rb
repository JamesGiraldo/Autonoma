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
  resources :cursos_usuarios
  resources :lineas, except: [:show] do
    resources :cursos, module: :lineas, except: [:show]
    resources :cursos_usuarios, module: :lineas, except: [:show]
  end
  resources :lineas
  resources :programas
  resources :facultades
  resources :facultades, except: [:show] do
    resources :programas, module: :facultades, except: [:show]
  end
  resources :proyecciones
  resources :comentarios
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
