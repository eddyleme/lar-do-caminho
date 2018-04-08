Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  root 'homes#index'
  resource :sessions
  resource :admin
	delete '/logout' => 'sessions#destroy'
	get '/logout' => 'sessions#destroy'

	resources :password_resets, only: [:new, :create, :edit, :update]
end
