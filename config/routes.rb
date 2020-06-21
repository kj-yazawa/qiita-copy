Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles, only: %i(index edit update)
  resource :user, only: %i() do
    resources :articles, only: %i(new edit create update destroy)
  end
end
