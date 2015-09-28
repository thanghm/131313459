Rails.application.routes.draw do
  
  devise_for :admins
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' } 

    get 'users' => 'sessions#new'
    post 'users' => 'sessions#new'
    post '/users.user' => 'posts#index'  
    post '/posts' => 'posts#create'
    patch '/posts/:id' => 'posts#update'
    get '/users/allpost' => 'posts#manager_post'
  
  resources :users do
    resources :posts, :only => [:index, :show, :new, :edit, :update, :destroy]
  end
  resources :posts, :only => [:index, :show, :apply] do
    member do
      get 'apply'
    end
  end

  root to: 'posts#index'

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
    get '/users/sign_out' => 'sessions#destroy'
    get '/users/auth/facebook' => 'omniauth_callbacks#facebook', :as => 'users_facebook'
    get '/users/auth/google_oauth2' => 'omniauth_callbacks#google_oauth2', :as => 'users_google_oauth2'
  end
  
end
