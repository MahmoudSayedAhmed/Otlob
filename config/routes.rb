Rails.application.routes.draw do
   get 'welcome/index'
   get 'events/index'
    mount ActionCable.server => '/cable'

  resources :groups
  resources :items
  resources :joineds
  resources :inviteds
  resources :friendships
  resources :orders
  resources :friendships_groups
  resources :password_resets

  get 'home/index'
  get 'latestorders/', to:'orders#latestorders'
 devise_for :users , :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  post '/set_friends' => 'orders#setfriends'
  get '/orders/orderDetails/:id' => 'orders#orderDetails'
  get '/InvitedFriends' => 'orders#InvitedFriends'
  get '/JoinedFriends' => 'orders#JoinedFriends'
  post '/orderDetails' => 'orders#AddorderDetails'
  post '/addfriends' =>'friendships#addFriend'
  post '/unfriend' =>'friendships#unfriend'
  post '/orders/finish' => 'orders#finish'
  post '/orders/load' => 'orders#load'
  post '/orders/invite' => 'orders#invite'
  post '/orders/get_data' => 'orders#get_data'
  post '/joineds/add' => 'joineds#add'
  post '/joineds/cancel' => 'joineds#cancel'


  authenticated :user do
   root 'home#index', as: 'authenticated_root'
  end
 # devise_scope :user do
 #   root 'devise/sessions#new'
 #  end
  resources :users
  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
