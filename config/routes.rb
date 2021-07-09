Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles, only: [:show, :new, :create, :edit, :update]
end
