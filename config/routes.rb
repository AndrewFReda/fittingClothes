Rails.application.routes.draw do


  get  'users/login', to: 'users#login',     as: 'login_user'
  post 'users/login', to: 'users#login_user'

  resources :users
  resources :shirts
  root to: 'users#new'
end
