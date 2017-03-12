Rails.application.routes.draw do
  get 'home/index'

  #root to: 'visitors#index'
  root to: 'home#index'
  devise_for :users
  resources :users
  resources :shifts
  resources :providers
  resources :sites
  resources :events




end
