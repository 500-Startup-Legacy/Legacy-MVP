Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    # resources :memories, only: [:index]
    resources :memorialized do
      resources :memories
    end
  end

  namespace :api do
    match '/users/:user_id/memorialized/family', to: 'memorialized#family', via: 'get'
    match '/users/:user_id/memorialized/friends', to: 'memorialized#friends', via: 'get'
    match '/users/:user_id/memorialized/coworkers', to: 'memorialized#coworkers', via: 'get'
    resources :users, only: [:show] do
      resources :memorialized, only: [:show, :index] do
        resources :memories, only: [:show, :index]
      end
    end
  end

  root "static_pages#home"
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/twilio/process_sms', to:'twilio#process_sms', via: 'post'
  get "/remember/:user_id", to: 'remember#show'

end
