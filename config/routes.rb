Rails.application.routes.draw do
  root 'pages#home'
  devise_for  :users,
              :path => '',
              :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'}

  # only want to create url path for showing users only
  resources :users, only: [:show]
end
