Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  authenticated do
    root :to => 'organisations#index', as: :authenticated

    get 'users/show'
    get 'users/join_organisation'
    post 'users/join_organisation'
    patch 'users/join_organisation'
    delete 'users/leave_organisation'

    get 'update' => 'organisations#update', as: 'update'
  end

  resources :organisations do
    resources :shifts
  end
end
