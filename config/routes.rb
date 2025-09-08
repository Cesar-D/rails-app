Rails.application.routes.draw do
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
