Rails.application.routes.draw do
  get 'albums/index'

  get 'albums/show'

  get 'albums/new'

  get 'albums/update'

  get 'events/index'

  get 'events/show'

  get 'events/new'

  get 'events/update'

  get '/login' => 'sessions#new'
  root 'home#index'
  resource :sessions

	delete '/logout' => 'sessions#destroy'
	get '/logout' => 'sessions#destroy'
end
