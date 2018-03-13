Rails.application.routes.draw do
   get 'events/index'
    mount ActionCable.server => '/cable'

  resources :groups
  resources :items
  resources :joineds
  resources :inviteds
  resources :friendships
  resources :orders
  resources :friendships_groups
  get 'home/index'
  get 'latestorders/', to:'orders#latestorders'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  post '/set_friends' => 'orders#setfriends'
  post '/addfriends' =>'friendships#addFriend'


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
