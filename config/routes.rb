Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles do #基本的なCRUD処理すべて
    resources :comments, only: [:new, :create]
  end
end
