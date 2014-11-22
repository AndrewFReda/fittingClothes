Rails.application.routes.draw do

  get   'shirts/upload',              to: 'shirts#upload', as: 'upload_shirt'
  get   'shirts/compare/:compare_id', to: 'shirts#new_compare'
  post  'shirts/compare/:compare_id', to: 'shirts#compare', as: 'compare_shirt'

  get  'users/login', to: 'users#login',     as: 'login_user'
  post 'users/login', to: 'users#login_user'

  resources :users
  resources :shirts
  root to: 'users#login'
end
