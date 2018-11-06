Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root to: 'games#home'

  resources :games, only: [:new, :show, :update, :create]
  get '/games/wait' => 'games#wait', as: 'game_wait'
  get '/games/:id/ready' => 'games#ready', as: 'game_ready'
  get '/games/:id/play' => 'games#play', as:'game_play'
  post '/games/:id/result' => 'games#over', as: 'game_over'
  get '/games/:id/result' => 'games#result', as: 'game_result'




  get '/pages/home' => 'pages#home'

  resources :drawings, except: [:edit, :update]
  get '/drawing/start' => 'drawings#start', as: 'start'
  get '/drawing/draw/:id' => 'drawings#draw', as: 'draw'

  resources :words, only: [:index, :show]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, except: [:index]
  get '/user/gallery' => 'users#gallery'
end
