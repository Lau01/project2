Rails.application.routes.draw do

  root to: 'pages#home'

  get '/pages/home' => 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :drawings, except: [:edit, :update]

  get '/drawing/start' => 'drawings#start'
  get '/drawing/draw' => 'drawings#draw'
end
