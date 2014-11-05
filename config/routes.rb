Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :spams, only: [:index]
  resources :regions, only: [:create, :show, :index] do
    resources :categories, only: [:create, :show]
    resources :posts, only: [:new, :create, :show, :update, :edit, :destroy]
  end

  root to: "regions#index"
end
