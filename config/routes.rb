Rails.application.routes.draw do
  devise_for :users
  
  # devise_for :users, :controllers => { user: 'users/show' }

  root to: 'home#index'

  authenticated do
    root :to => 'organisations#index', as: :authenticated

    get 'users/show'
    delete 'users/leave_organisation'
  end



  # get 'users/show'
  # delete 'users/leave_organisation'

  resources :organisations do
    resources :shifts
  end
end
