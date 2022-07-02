Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'home/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'home#index'
  resources :users
  resources :questions, only: %i[new create show] do
    resource :answers, only: %i[new create]
    resource :favorites, only: %i[create destroy]
  end
  post 'questions/confirm', to: 'questions#confirm'
end
