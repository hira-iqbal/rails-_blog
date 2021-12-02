Rails.application.routes.draw do
  get 'session/new'
  devise_for :users
  root "articles#index"

  resources :users
  resources :articles do
    resources :comments
  end
end
