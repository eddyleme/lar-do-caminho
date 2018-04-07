Rails.application.routes.draw do
  get 'homes/index'

  get 'homes/contact'

  get 'tickets/index'

  get 'tickets/show'

  get 'tickets/new'

  get 'tickets/update'

  get 'photos/index'

  get 'photos/show'

  get 'photos/new'

  get 'photos/update'

  get 'packages/index'

  get 'packages/show'

  get 'packages/new'

  get 'packages/update'

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
