Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  authenticated :users do
    root :to => 'organisations#index', as: :authenticated_root

    get 'users/show'
    get 'users/join_organisation'
    post 'users/join_organisation'
    patch 'users/join_organisation'
    delete 'users/leave_organisation'
  end

  resources :organisations do
    resources :shifts
  end
end
