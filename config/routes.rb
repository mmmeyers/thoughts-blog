Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope "/admin" do 
    resources :users
  end

  # authenticated :user do
  #   root to: 'posts#index', as: :authenticated_root
  # end

  root to: 'posts#index'
  
  resources :posts do
    resources :comments
    resources :tags, only: [:index, :show]
  end

  resources :roles
  resources :affiliations
  # resources :tags, only: [:index, :show]

end
