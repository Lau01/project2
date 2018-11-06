Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root to: 'games#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :games, only: [:create, :show]
  get 'game/home' => 'games#home', as: 'home'
  get 'game/wait/:id' => 'games#wait', as: 'wait'
  get 'game/play/:id' => 'games#play', as:'play'
  post 'game/:id/result' => 'games#result', as:'result'
  get 'game/:id/result' => 'games#result', as:'result'

  resources :words, only: [:index, :show]
  resources :drawings, except: [:edit, :update]
  # get '/drawing/start' => 'drawings#start', as: 'start'
  # get '/drawing/draw/:id' => 'drawings#draw', as: 'draw'

  resources :users, except: [:index]
  get '/user/gallery' => 'users#gallery'
end
