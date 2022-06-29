Rails.application.routes.draw do
  get 'home/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'home#index'
  resources :users
  resources :questions
end
