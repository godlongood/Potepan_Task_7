Rails.application.routes.draw do
  root "rooms#index"

  devise_for :users

  resources :rooms
end
