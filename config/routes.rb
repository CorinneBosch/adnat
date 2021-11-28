Rails.application.routes.draw do
  devise_for :users
  
  # devise_for :users, :controllers => { user: 'users/show' }

  root to: 'organisations#index'

  authenticated do
    root :to => 'organisations#index', as: :authenticated

    get 'users/show'
    get 'users/join_organisation'
    post 'users/join_organisation'
    patch 'users/join_organisation'
    delete 'users/leave_organisation'
  end



  # get 'users/show'
  # delete 'users/leave_organisation'

  resources :organisations do
    resources :shifts
  end
end
