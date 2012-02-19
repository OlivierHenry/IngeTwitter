Twitter::Application.routes.draw do

  get "pages/home"
  resources :microposts, :only => [:create, :destroy]
  resources :users
  resources :users do
	member do
		get :following, :followers
	end
  end
  resources :sessions, :only => [:new, :create, :destroy]
  get "sessions/new"

  get "users/new"

  match '/contact', :to => 'pages#contact'
  match '/about', 	:to => 'pages#about'
  match '/help',	:to => 'pages#help'
  match '/',		:to => 'pages#home'
  match '/signup',	:to => 'users#new'
  match '/signin',	:to => 'sessions#new'
  match '/signout',	:to => 'sessions#destroy'
  

  get "pages/contact"

 
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'pages#home'

end
