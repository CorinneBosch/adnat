Rails.application.routes.draw do
  # get 'home/index'
  devise_for :users

  root to: 'organisations#index'
  
  resources :organisations do
    resources :shifts
  end
  # get 'organisations', to: 'organisations#index'
  # get 'organisations/:id', to: 'organisations#show'

  # get 'organisations', to: 'organisations#new'
  # post 'organisations/:id', to: 'organisations#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
