Rails.application.routes.draw do
  root to: 'units#index'
  resources :users
  resources :units do
    member do
      resources :netas, :relationships
    end
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
