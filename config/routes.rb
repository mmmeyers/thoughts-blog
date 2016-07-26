Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # Telling Devise which controller will implement Omniauth callbacks.
  # controllers/users/omniauth_callbacks_controller.rb

  scope "/admin" do
    resources :users
  end

  root to: 'posts#index'

  resources :posts do
    resources :comments
    resources :tags, only: [:index, :show]
  end

  resources :roles
  resources :affiliations
  # resources :tags, only: [:index, :show]

end
