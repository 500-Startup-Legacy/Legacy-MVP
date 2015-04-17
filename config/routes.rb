Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :memories
  end

  root "static_pages#home"
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

end
