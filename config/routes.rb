Rails.application.routes.draw do
  get 'carts/show'
  get 'photo_albums#index'
    resources :photo_albums do
      resources :photos, shallow: true
    end

  get '/login' => 'sessions#new'
  root 'homes#index'
  resource :sessions

	delete '/logout' => 'sessions#destroy'
	get '/logout' => 'sessions#destroy'

	resources :password_resets, only: [:new, :create, :edit, :update]
end
