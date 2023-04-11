Rails.application.routes.draw do
  resources :skills
  resources :assets
  # Defines the root path route ("/")
  root "welcome#index"

  devise_for :users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
