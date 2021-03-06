Rails.application.routes.draw do
  resources :posts

  resources :comments
  delete '/comments/:id/delete', to: 'comments#destroy'
  
  resources :users

  resources :tasks
  post '/tasks/:id/toggle_status', to: "tasks#toggle_status", as: "toggle_status"
  post '/tasks/:id/toggle_claim', to: "tasks#toggle_claim", as: "toggle_claim"
  post '/tasks/:id/toggle_pinned', to: "tasks#toggle_pinned", as: "toggle_pinned"
  get '/tasks/:id/toggle_status', to: "tasks#toggle_status", as: "toggle_status_get"
  get '/tasks/:id/toggle_claim', to: "tasks#toggle_claim", as: "toggle_claim_get"
  get '/tasks/:id/toggle_pinned', to: "tasks#toggle_pinned", as: "toggle_pinned_get"

  
  
  root 'sessions#new'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get '/home', to: "sessions#home", as: "home"

  # resources :dices
  get '/dice', to: "dices#index", as: "index"
  post '/dice', to: "dices#create_new"
  get '/dices/:id/new', to: "dices#new", as: "enter_name"
  post '/dices/:id/new', to: "dices#create", as: "roll_dice"
  get '/dices/:id', to: "dices#show", as: "result"
  delete '/dices/:id', to: "dices#destroy", as: "replay"

  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
