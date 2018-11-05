Rails.application.routes.draw do

  resources :games, only: [:new, :show, :update, :create]
  get 'game/wait' => 'games#wait', as:'wait'
  get 'game/ready/:id' => 'games#ready', as: 'ready'
  get 'game/result' => 'games#result', as:'result'
  get 'game/play/:id' => 'games#play', as:'play'

  root to: 'games#new'

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
