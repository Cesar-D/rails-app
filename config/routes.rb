Rails.application.routes.draw do
  patch "/articles/:id", to: "articles#update"
  get "/articles/:id/edit", to: "articles#edit", as: 'article_edit'
  get "/articles/:id", to: "articles#show", as: 'article'
  post "/articles", to: "articles#create"
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
