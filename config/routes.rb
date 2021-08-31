Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # spot transmet l'id pour le favorite pour la creation
  resources :spots, only: [:show, :index] do
    resources :favorite_spots, only: [:create]
  end
  resources :favorite_spots, only: [:index, :destroy]
  resources :users, only: [:edit, :update]
  resources :forecasts, only:[:show] do
    resources :validation_forecasts, only: [:create]
  end
end
