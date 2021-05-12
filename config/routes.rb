Rails.application.routes.draw do
  devise_for :users
  get "/" => "home#top"
  get "about" => "home#about"

  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resources :likes, only: [:create]
  end
end
