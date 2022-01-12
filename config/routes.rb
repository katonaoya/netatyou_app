Rails.application.routes.draw do

  ActiveSupport::Inflector.inflections do |inflect|
    inflect.irregular 'live', 'lives'
  end

  root to: 'units#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  

  resources :users
  
  resources :lives, shallow: true do
    member do
      get '/koban', to: 'lives#koban'
      patch '/koban', to: 'lives#koban_update'
      resources :comedians
    end
  end

  resources :units, shallow: true do
    member do
      resources :netas, :relationships
      get '/neta_change', to: 'netas#change'
      post '/neta_change', to: 'netas#choice'
    end
  end
  
end
