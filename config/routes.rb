Rails.application.routes.draw do
  root 'homes#index'

  # get 'carts/show'
  resources :charges

  get 'albums/index'
  resources :albums do
    resources :photos, shallow: true
  end
  

  get '/login' => 'sessions#new'
  get '/contact' => 'homes#contact'

  resource :sessions
	resources :password_resets, only: [:new, :create, :edit, :update]

  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'


	resources :events, shallow: true do
		resources :packages do
			resources :tickets
		end
	end

end
