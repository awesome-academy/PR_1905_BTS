Rails.application.routes.draw do
  root   'static_pages#home'
  get  '/support',    to: 'static_pages#support'
  get    '/help',     to: 'static_pages#help'
  get    '/about',    to: 'static_pages#about'
  get    '/contact',  to: 'static_pages#contact'
  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'

  resources :users, only: [:index, :create, :new, :show,:edit, :update]

  namespace :admin do
    resources :users do
    match :create_admin, via: [:post]
    match :set_to_normal_user, via: [:post]
    end

    resources :tours, only: [:new, :create, :destroy, :update]
  end
end
