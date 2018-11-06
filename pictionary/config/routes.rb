Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root to: 'games#new'

  resources :games, only: [:new, :show, :update, :create]
  get 'game/wait' => 'games#wait', as: 'wait'
  get 'game/ready/:id' => 'games#ready', as: 'ready'
  get 'game/play/:id' => 'games#play', as:'play'
  get 'game/result:id' => 'games#result', as:'result'


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
