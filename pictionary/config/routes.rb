Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root to: 'games#home'

  resources :games, only: [:show, :update, :create]
  get 'game/home' => 'games#home', as: 'home'
  get 'game/wait' => 'games#wait', as: 'wait'
  get 'game/ready/:id' => 'games#ready', as: 'ready'
  get 'game/play/:id' => 'games#play', as:'play'
  get 'game/result' => 'games#result', as:'result'

  resources :drawings, except: [:edit, :update]
  # get '/drawing/start' => 'drawings#start', as: 'start'
  # get '/drawing/draw/:id' => 'drawings#draw', as: 'draw'

  resources :words, only: [:index, :show]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, except: [:index]
  get '/user/gallery' => 'users#gallery'
end
