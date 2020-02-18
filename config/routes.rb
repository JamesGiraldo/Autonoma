Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
  resources :lineas
  resources :programas
  resources :facultades
  resources :proyecciones
  resources :comentarios

  resources :lineas, except: [:show] do
    resources :cursos, module: :lineas, except: [:show]
  end
  post 'linea/:linea_id/cursos/:id/asignar', to: "linea/cursos#asignar", as: "asignar"
end
