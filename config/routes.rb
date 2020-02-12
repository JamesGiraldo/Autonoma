Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :users, only: [:index]
  resource :user, only: [:edit, :destroy, :update] do
    collection do
      patch 'update_password'
      get :cambiar_password
    end
  end

  resources :cursos
  resources :lineas
  resources :programas
  resources :facultades
end
