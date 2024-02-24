Rails.application.routes.draw do
  devise_for :users

  resources :links
  resources :views, path: :v, only: [:show]

  root "links#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
