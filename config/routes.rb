Rails.application.routes.draw do

  devise_for :users
  scope "/admin" do 
    resources :users
  end

  root to: 'posts#index'
  
  resources :tags
  resources :post_tags
  resources :comments
  resources :posts
  resources :roles
  
end
