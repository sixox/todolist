Rails.application.routes.draw do
  resources :posts
  get 'form/index'
  resources :contacts, only: [:new, :create, :show]
  resources :inquries, only: [:new, :create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
