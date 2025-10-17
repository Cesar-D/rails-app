Rails.application.routes.draw do
  resources :categories
  resources :profiles

  get '/confirm_email/:token', to: "users#confirm_email"
  delete '/logout', to: "sessions#destroy", as: 'logout'

  post '/login', to: "sessions#create", as: 'new_user_session'
  get '/login', to: "sessions#login", as: 'login'

  delete "/user/:id", to: "users#destroy", as: 'user_delete'
  patch "/user/:id", to: "users#update"
  get "/user/:id/edit", to: "users#edit", as: 'user_edit'
  get '/user/:id', to: "users#show", as: 'user'
  get '/users', to: "users#index"
  post '/users', to: "users#create"
  get '/signup', to: "users#new", as: 'signup'

  delete "/article/:id", to: "articles#destroy", as: 'article_delete'
  patch "/article/:id", to: "articles#update"
  get "/article/:id/edit", to: "articles#edit", as: 'article_edit'
  get "/article/:id", to: "articles#show", as: 'article'
  post "/articles", to: "articles#create"
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
