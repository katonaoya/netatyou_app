Rails.application.routes.draw do

  ActiveSupport::Inflector.inflections do |inflect|
    inflect.irregular 'live', 'lives'
  end

  root to: 'units#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'

  resources :users, shallow: true do
    member do
      resources :lives
    end
  end

  resources :units, shallow: true do
    member do
      resources :netas, :relationships
    end
  end
  
end
