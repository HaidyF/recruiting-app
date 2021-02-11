Rails.application.routes.draw do
  root 'sessions#welcome'
  # resources :recruiters, only: [:show] do
  #   resources :jobs, only: [:show, :index] 
    #comment/application
  # end
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  
  # resources :recruiters
  resources :jobs do
    resources :applications
    resources :comments, shallow: true  
  end
  resources :users, except: :destroy
  resources :applications
  resources :comments
  
  delete '/users/:id', to: 'users#destroy', as: "delete_user"
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
