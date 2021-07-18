Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resource :timeline, only: [:show]

  resources :articles do #基本的なCRUD処理すべて
    resources :comments, only: [:new, :index, :create]

    resource :like, only: [:show, :create, :destroy]
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
end
