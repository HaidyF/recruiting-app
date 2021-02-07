Rails.application.routes.draw do
  root 'sessions#welcome'
  
  resources :recruiters
  resources :jobs
  resources :users
  resources :applications
  resources :comments

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
