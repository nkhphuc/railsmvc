# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :customers
  devise_for :users
  resources :grades, module: :moderators
  resources :students, module: :moderators
  root 'front/pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
