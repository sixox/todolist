Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "home#index"

  get '/grades/:id', to: 'grades#redirect_to_slug', constraints: { id: /\d+/ }
  get '/products/:id', to: 'products#redirect_to_slug', constraints: { id: /\d+/ }
  get '/posts/:id', to: 'posts#redirect_to_slug', constraints: { id: /\d+/ }
  get '/packings/:id', to: 'packings#redirect_to_slug', constraints: { id: /\d+/ }



  resources :grades
  resources :products
  resources :posts
  resources :packings

  get 'form/index'
  resources :contacts, only: [:new, :create, :show]
  resources :inquries, only: [:new, :create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/sitemap.xml', to: 'sitemaps#index', defaults: { format: 'xml' }




end
