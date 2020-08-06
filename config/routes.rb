Rails.application.routes.draw do

  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do

  	member do
  		get :following, :followers
  	end
  end
  resources :relationships, only: [:create, :destroy]

  resources :books, only: [:create, :index, :show, :destroy , :edit, :update]  do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  get 'search' => 'search#search'

end