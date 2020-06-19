Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :lists do
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
  end
  resources :items, only: :destroy
end
