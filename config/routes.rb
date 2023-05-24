Rails.application.routes.draw do
  resources :articles, only: :index
  resources :articles, only: %i[index show]
  devise_for :users
end
