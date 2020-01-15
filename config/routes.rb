Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, path: '' , path_names: {sign_in:'login', sign_out: 'logout', sign_up: 'register'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :likes
  resources :comments

  resources :users, only: [:show, :index]
end
