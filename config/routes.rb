Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/admin/sidekiq'
  
  get 'session/new'
  devise_for :users
  root "articles#index"

  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user

  resources :articles do
    resources :comments
  end
end
