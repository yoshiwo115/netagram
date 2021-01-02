Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  #resources 必要なルーティング全部作ってくれる
  resources :users
  resources :netas
end
