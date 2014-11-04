Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :regions, only: [:create, :show, :index] do
    resources :categories, only: [:new, :create]
  end

  root to: "regions#index"
end
