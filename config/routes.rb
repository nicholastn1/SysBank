Rails.application.routes.draw do

  devise_for :users

  # Define a rota padrão
  root to: "accounts#index" # "welcome#index"

  resources :transactions
  resources :accounts
  resources :agencies

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end