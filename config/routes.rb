Rails.application.routes.draw do

  ActiveSupport::Inflector.inflections do |inflect|
    inflect.irregular 'live', 'lives'
  end

  root 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  
  resources :users
  
  resources :lives, shallow: true do
    member do
      get '/koban', to: 'lives#koban'
      patch '/koban', to: 'lives#koban_update'
      resources :comedians, only: [:new, :create, :edit, :update, :destroy]
      resources :staffs, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :units, shallow: true do
    member do
      resources :relationships, only: [:new, :create, :destroy]
      resources :netas, except: [:index]
      get '/neta_change', to: 'netas#change'
      post '/neta_change', to: 'netas#choice'
    end
  end

resources :account_activations, only: [:edit]

get '/admin_menu', to: 'admins#admin_menu'
  
end
