Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  get 'posts/new'
  get "/" => "home#top"
  get "about" => "home#about"
end
