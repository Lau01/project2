Rails.application.routes.draw do

  # Establish the socket connection (server-side)
  # ActionCable will establish a WebSocket connection on localhost:3000/cable
  # and begin listening for socket requests on that URI
  # Code from: https://blog.heroku.com/real_time_rails_implementing_websockets_in_rails_5_with_action_cable
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
