Rails.application.routes.draw do
  get 'users/join_organisation'
  get 'users/leave_organisation'
  # get 'home/index'
  devise_for :users
  
  authenticated do
    root :to => 'organisations#index', as: :authenticated
  end

  root to: 'home#index'

  # resources :organisations do
  #   get 'users#join_organisation', :on => :user
  # end

  resources :organisations do
    resources :shifts
  end
end
