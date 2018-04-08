Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  root 'homes#index'
  resource :sessions

	delete '/logout' => 'sessions#destroy'
	get '/logout' => 'sessions#destroy'

	resources :password_resets, only: [:new, :create, :edit, :update]
	resources :events do
		resources :packages do
			resources :tickets
		end
	end





end
