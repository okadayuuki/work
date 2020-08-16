Rails.application.routes.draw do
	get 'home/about'
	devise_for :users
	root 'home#top'
	constraints -> request { request.session[:user].present? } do
  		root to:'books#index'
  	end
  	

  	resources :users,only: [:show,:index,:edit,:update]
  	resources :books
end