Rails.application.routes.draw do
  devise_for :users
  get "/" => "home#top"
  get "about" => "home#about"
  resources :posts
end
