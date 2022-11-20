Rails.application.routes.draw do
  # Todo: Check if all routes still be in use
  
  # Used by Devise Gem
  devise_for :users
  
  # Custom routes
  resources :users do
    post :finished_account
  end
  
  namespace :transactions do
    resources :withdraw, only: [:index, :create]
    resources :deposit,  only: [:index, :create]
    resources :transfer, only: [:index, :create]
    resources :historic, only: [:index]
  end

  # Todo: Change name root, is strange use that name
  root to: 'home#index'
end
