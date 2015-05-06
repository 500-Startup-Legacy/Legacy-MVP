Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :subjects, only: [:new, :create] do
      resources :memories
    end
  end

  namespace :api do
    match '/users/:user_id/subjects/family', to: 'subjects#family', via: 'get'
    match '/users/:user_id/subjects/friends', to: 'subjects#friends', via: 'get'
    match '/users/:user_id/subjects/coworkers', to: 'subjects#coworkers', via: 'get'

    match '/released_users/:released_user_id/memorialized/:user_id/memories', to: 'released_memories#index', via: 'get'

    resources :users, only: [:show] do
      resources :subjects, only: [:show, :index] do
        resources :memories, only: [:show, :index]
      end
    end
  end

  root "static_pages#home"
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/twilio/process_sms', to:'twilio#process_sms', via: 'post'
  # get "/remember/:user_id", to: 'remember#show'

end
