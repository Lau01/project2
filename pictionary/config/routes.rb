Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root to: 'games#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :games, only: [:create, :show]
  get '/game/home' => 'games#home', as: 'home'
  get '/games/:id/play' => 'games#play', as:'game_play'
  post '/games/:id/result' => 'games#over', as: 'game_over'
  get '/games/:id/result' => 'games#result', as: 'game_result'

  resources :drawings, except: [:edit, :update]
  resources :words, only: [:index, :show]
  resources :users, except: [:index]
  get '/user/gallery' => 'users#gallery'
end
