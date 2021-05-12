Rails.application.routes.draw do
  devise_for :users
  get "/" => "home#top"
  get "about" => "home#about"

  get "/users/:id" => "users#show"
  get "/users/:id/edit" => "users#edit"
  get "/users/:id/update" => "users#update"
  
  resources :posts
end
