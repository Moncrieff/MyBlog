Rails.application.routes.draw do
  root "posts#index"

  resources :posts
  resources :images, only: [:show]
end
