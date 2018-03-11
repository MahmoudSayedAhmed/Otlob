Rails.application.routes.draw do
  resources :groups
  resources :items
  resources :joineds
  resources :inviteds
  resources :friendships
  resources :orders
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
   root 'home#index', as: 'authenticated_root'
  end
 devise_scope :user do
   root 'devise/sessions#new'
  end
  resources :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
