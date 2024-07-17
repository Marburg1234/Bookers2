Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #TOPページをルーティングに設定する
  # get 'homes#top'
  root to: 'homes#top'
  # Aboutページのルーティングを作成
  get 'home/about' => 'homes#about', as: 'about'

  resources :users, only: [:edit, :show, :update, :index]

  resources :books


end
