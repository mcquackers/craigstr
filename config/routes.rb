Rails.application.routes.draw do
  resources :regions, only: [:create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root to: "regions#index"
end
