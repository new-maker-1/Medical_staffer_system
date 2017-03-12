Rails.application.routes.draw do
  get 'home/index'
  get '/providers/history',to: 'providers#history',as: :providers_history
  post '/providers/:id/undo', to: 'providers#undo', as: :undo
  #get '/sites/history',to: 'sites#history',as: :sites_history
  #post '/sites/:id/undo', to: 'sites#undo', as: :undo
  #root to: 'visitors#index'
  root to: 'home#index'
  devise_for :users
  resources :users
  resources :shifts
  resources :providers do
    collection {post :import}
  end
  resources :sites do
    collection {post :import}
  end
  resources :events

end
