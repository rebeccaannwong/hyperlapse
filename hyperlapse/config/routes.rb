Rails.application.routes.draw do
  # INDEX ROUTE
  root 'application#index'

  # LOCATION ROUTES
  get 'locations' => 'locations#index'
  get 'locations/:lat/:long' => 'locations#show'


  # SESSIONS ROUTES
  get 'sessions/new' => 'sessions#new', as: 'login'
  post 'sessions/new'=> 'sessions#create'
  delete 'sessions'  => 'sessions#destroy'

  #USERS ROUTE
  get "/users/:id" => "users#show"

  resources :users, only: [:new, :create, :show]


end
