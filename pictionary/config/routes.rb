Rails.application.routes.draw do

  root to: 'pages#home'

  get '/pages/home' => 'pages#home'

  resources :drawings, except: [:edit, :update]
  get '/drawing/start' => 'drawings#start'
  get '/drawing/draw' => 'drawings#draw'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, except: [:index]

end
