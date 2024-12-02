Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  defaults format: :json do
    #Routes for pets
    resources :pets do
      resources :appointments, only: [:index, :show, :create, :update, :destroy]
    end

    #Routes for owners
    resources :owners do
      resources :pets, only: [:index, :show, :create, :update, :destroy]
    end

    #Routes for appointments
    resources :appointments, only: [:index, :show, :create, :update, :destroy]

    #Routes for Users and session
    resources :users, only: [:create, :update, :destroy]
    get '/users/current_user' => 'users#current_user'
    post "/sessions" => "sessions#create"
  end
end
