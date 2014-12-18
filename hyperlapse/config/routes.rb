Rails.application.routes.draw do
  # INDEX ROUTE
  root 'application#index'

  # LOCATION ROUTES
  get 'locations' => 'locations#index'
  get 'locations/:id' => 'locations#show'

  # SESSIONS ROUTES
  get 'sessions/new' => 'sessions#new', as: 'login'
  post 'sessions/new'=> 'sessions#create'
  delete 'sessions'  => 'sessions#destroy'

  # USERS ROUTE
  resources :users, only: [:new, :create, :show]





end
