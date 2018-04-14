Rails.application.routes.draw do
  get 'carts/show'
  get 'albums/index'
    resources :albums do
      resources :photos, shallow: true
    end
  get '/donate' => 'homes#donate'
  get '/login' => 'sessions#new'
  get '/contact' => 'homes#contact'
  root 'homes#index'
  resource :sessions

	delete '/logout' => 'sessions#destroy'
	get '/logout' => 'sessions#destroy'

	resources :password_resets, only: [:new, :create, :edit, :update]
	resources :events, shallow: true do
		resources :packages do
			resources :tickets
		end
	end





end
