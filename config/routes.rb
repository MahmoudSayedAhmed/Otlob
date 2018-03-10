Rails.application.routes.draw do
  resources :groups
  resources :items
  resources :joineds
  resources :inviteds
  resources :friendships
  resources :orders
  devise_for :users
  get 'home/index'

  resources :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
