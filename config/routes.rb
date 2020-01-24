Rails.application.routes.draw do
	get 'public/index'
	get 'local/index'
	get 'search/index'
	get 'friends/index'
	get 'friends/destroy'
	get 'friendship/index'
	get 'friendship/destroy'
	get '/users' => 'users#index'
	get 'users/:id' => 'users#show'
	get 'search' => 'search#index'
	get '/stories' => 'stories#index'
	root 'stories#index'
	resources :stories, only: [:new, :create, :show, :edit, :update, :destroy]
	resources :users, only: [:show, :edit, :update]
	devise_for :users, :path_prefix => 'd'
	resources :conversations do
		resources :messages
	end
	resources :friendships, only: [:create]
	post '/confirm_friends', controller: :friendships, action: :confirm, as: :confirm_friendship
end
