Rails.application.routes.draw do
  resources :instruments
  root to: 'instruments#index'
end
