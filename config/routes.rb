# frozen_string_literal: true

Rails.application.routes.draw do
  resources :schools
  resources :student_classes do
    collection do
      get 'get_teachers'
      get 'update_teachers'
    end
  end
  resources :teachers
  devise_for :customers
  devise_for :users
  resources :moderators, only: %i[index]
  resources :grades, module: :moderators
  resources :students, module: :moderators do
    member do
      patch 'move_up'
      patch 'move_down'
    end
  end
  authenticated :user do
    root to: 'moderators#index', as: :authenticated_moderator
  end
  authenticated :customer do
    root to: 'customers/customer_pages#index', as: :authenticated_customer
  end
  root 'front/pages#index'
  get 'customer_index' => 'customers/customer_pages#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
