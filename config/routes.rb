Rails.application.routes.draw do
  root 'toppages#index'
  
  resources :places, only: [:create, :destroy]
end
