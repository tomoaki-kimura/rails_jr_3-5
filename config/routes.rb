Rails.application.routes.draw do
  root 'toppages#index'
  
  resources :places, only: [:show, :create, :destroy]
end
