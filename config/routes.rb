Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "pages/profile", to: "pages#profile", as: "profile"
  resources :lists do
    member do
      get 'new_list_email'
    end
    resources :items, only: [ :index, :show, :new, :create, :edit, :update ] do
      member do
        patch 'toggle_complete'
      end
    end
  end
  resources :items, only: :destroy

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :lists, only: [ :index, :show, :create, :destroy ] do
        resources :items, only: [ :index, :show, :update, :create, :destroy ]
      end
    end
  end
end
