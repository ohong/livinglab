Rails.application.routes.draw do

  root 'pages#home'
  devise_for  :users,
              :path => '',
              :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'}

  # only want to create url path for showing users only
  resources :users, only: [:show]
  # no restriction on rooms
  resources :rooms
  # route to photos
  resources :photos
  # route to messages within conversations
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
end
