Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resource :user, only: [:edit, :destroy, :update] do
    collection do
      patch 'update_password'
      get :cambiar_password
    end
  end

  resources :cursos

end
