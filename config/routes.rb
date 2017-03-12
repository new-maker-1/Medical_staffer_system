Rails.application.routes.draw do
  get 'home/index'

  #root to: 'visitors#index'
  root to: 'home#index'
  devise_for :users
  resources :users
  resources :shifts
  resources :providers
  resources :sites
  match "home/data", :to => "home#data", :as => "data", :via => "get"
  match "home/db_action", :to => "home#db_action", :as => "db_action", :via => "get"
  #match "home/db_action", :to => "home#db_action", :as => "db_action", :via => "post"
  get 'book/list'
  get 'book/new'
  post 'book/create'
  patch 'book/update'
  get 'book/list'
  get 'book/show'
  get 'book/edit'
  get 'book/delete'
  get 'book/update'
  get 'book/show_subjects'

end
