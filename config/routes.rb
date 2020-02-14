Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :users, only: [:index] do
    collection do
      get :index_instructores
    end
  end
  resource :user, only: [:edit, :destroy, :update , :show] do
    collection do
      patch 'update_password'
      get :cambiar_password
      get :show
    end
  end  
  resources :cursos
  resources :lineas
  resources :programas
  resources :facultades

  resources :lineas, except: [:show] do
    resources :cursos, module: :lineas, except: [:show]
  end
end
