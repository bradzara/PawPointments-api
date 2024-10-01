Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  #Routes for pets
  # get "/pets" => "pets#index"
  # get "/pets/:id" => "pets#show"
  # post "/pets" => "pets#create"
  # patch "/pets/:id" => "pets#update"
  # delete "pets/:id" => "pets#destroy"
  resources :pets do
    resources :appointments, only: [:index, :show, :create, :update, :destroy]
  end


  resources :owners do
    resources :pets, only: [:index, :show, :create, :update, :destroy]
  end


end
