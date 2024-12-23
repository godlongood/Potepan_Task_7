Rails.application.routes.draw do
  root "searches#search"

  get "account" => "users#account"

  #検索機能
  get "search" => "searches#search"


  devise_for :users

  resources :users, only: [] do #crudのルートを作成せず、以下のルートのみを作成
    member do #特定のユーザーに紐づくアクションを定義するスコープを作成
      get :reservations # /users/:id/reservations のルートを作成
    end
  end

  resources :rooms do
    resource :reserves, only: [:new, :create, :destroy] #RoomモデルにReserveモデルをネスト
  end
end
