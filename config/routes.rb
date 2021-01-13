Rails.application.routes.draw do
  
  root to: 'instruments#index'
  resources :instruments

  get "/login" => "clearance/sessions#new", as: "login"
  delete "/logout" => "clearance/sessions#destroy", as: "logout"
  get "/register" => "clearance/users#new", as: "register"

  resources :users, controller: 'users', only: 'create'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:edit, :update]
  # end

end
