Rails.application.routes.draw do
  devise_for :users
  get "/" => "home#top"
  get "about" => "home#about"

  get "users/:id/likes" => "users#likes"

  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
end
                                1