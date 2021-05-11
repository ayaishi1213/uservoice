Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  get "/" => "home#top"
  get "about" => "home#about"
end
