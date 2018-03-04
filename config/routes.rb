Rails.application.routes.draw do
	root to: 'recipes#index'
  
	get '/users', to: 'users#index'  
	get '/user/:id', to: 'users#show', as: 'user'

  resources :recipes
  
  resources :recipe_shares
  
	devise_for :users, :controllers => { :omniauth_callbacks => "users/callbacks" }


end
