Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'home/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'home#index'
  resources :users
  resources :questions, only: %i[index new create show destroy] do
    resource :answers, only: %i[new create destroy]
    resource :favorites, only: %i[create destroy]
  end
  resources :mypage, only: %i[index]
  post 'questions/confirm', to: 'questions#confirm'
end
