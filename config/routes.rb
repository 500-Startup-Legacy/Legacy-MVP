Rails.application.routes.draw do
  get 'users/new'

  resources :users
  root "static_pages#home"
  match '/signup', to: 'users#new', via: 'get'

end
