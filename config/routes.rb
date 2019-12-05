Rails.application.routes.draw do
  root   'tours#index'
  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'

  resources :tours, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:create, :update, :destroy, :new]
    resources :ratings, only: :create
  end
  resources :bookings, only: :index
  resources :reviews, only: [:create, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end

  namespace :admin do
    resources :users
    resources :tours
    resources :bookings, only: [:update, :index]
  end

  resources :users, only: [:create, :new, :show,:edit, :update]
end
