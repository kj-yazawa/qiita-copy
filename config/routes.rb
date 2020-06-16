Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles, only: :index
  resources :users, only: %i() do
    resources :articles, only: %i(new edit create update destroy), module: :user
  end
end
