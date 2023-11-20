Rails.application.routes.draw do
  # devise_for :users, defaults: { format: :json }

  resources :users, only: [:create, :show, :index]
  resources :boards, only: [:create, :show, :index]
end