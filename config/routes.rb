Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :users, only: %i[index ver_datos] do
    get :ver_datos, on: :member
    resources :comments, except: %i[:show]
    collection do
      get :instructores
      get :decanos
      get :vicerrectores
      get :directores
    end
  end

  resource :user, only: %i[edit destroy update show] do
    collection do
      patch 'update_password'
      get :cambiar_password
    end
  end

  resources :cursos
  resources :cursos_usuarios
  resources :lineas

  resources :lineas, except: [:show] do
    resources :cursos, module: :lineas, except: [:show]
    resources :cursos_usuarios, module: :lineas, except: [:show]
  end

  resources :programas
  resources :programas, except: [:show] do
    resources :users, module: :programas, except: [:show]
  end
  resources :facultades
  resources :facultades, except: [:show] do
    resources :programas, module: :facultades, except: [:show]
  end

  resources :proyecciones
  resources :comentarios
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get "*any", via: :all, to: "application#catch_404"
end
