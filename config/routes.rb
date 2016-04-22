Rails.application.routes.draw do

  devise_for :users
  scope "/admin" do 
    resources :users
  end

  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end
  root to: 'welcome#index'
  
  resources :tags
  resources :post_tags
  resources :comments
  resources :posts
  resources :roles
  
end
