Rails.application.routes.draw do
  root "articles#index"

  resources :articles

  # get    '/articles'          => 'articles#index'

  # get    '/articles/new'      => 'articles#new'

  # get    '/articles/:id'      => 'articles#show'
  # post   '/articles'          => 'articles#create'
  # get    '/articles/:id/edit' => 'articles#edit'
  # patch  '/articles/:id'      => 'articles#update'
  # put    '/articles/:id'      => 'articles#update'
  # delete '/articles/:id'      => 'articles#destroy'

end
