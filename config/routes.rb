Rails.application.routes.draw do
  get 'welcome/index'
  resources :transactions
  resources :accounts
  resources :agencies
  devise_for :users

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
