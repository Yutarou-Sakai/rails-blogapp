Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles #基本的なCRUD処理すべて
end
