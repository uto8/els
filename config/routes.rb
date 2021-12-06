Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'users/new'
  get 'user/new'
  root "pages#home"
  get '/about', to:'pages#about'
  get '/contact', to:'pages#contact'
  resources :users
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resources :sessions, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
