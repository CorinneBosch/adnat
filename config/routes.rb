Rails.application.routes.draw do
  # get 'home/index'
  devise_for :users
  
  authenticated do
    root :to => 'organisations#index', as: :authenticated
  end

  root to: 'home#index'

  resources :organisations do
    resources :shifts
  end
end
