Rails.application.routes.draw do

  root to: 'pages#home'

  get '/pages/home' => 'pages#home'

  resources :drawings, except: [:edit, :update]
  get '/drawing/start' => 'drawings#start', as: 'start'
  get '/drawing/draw/:id' => 'drawings#draw', as: 'draw'

  resources :words, only: [:index, :show]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, except: [:index]

end
