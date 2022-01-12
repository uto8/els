Rails.application.routes.draw do
  get 'answers/index'
  get 'answers/new'
  namespace :admin do
    get "/dashboard", to: 'pages#home'
    resources :users, only: [:index, :update, :destroy]
    resources :categories do 
      resources :words
    end
  end
  root "pages#home"
  get '/about', to:'pages#about'
  get '/contact', to:'pages#contact'
  resources :users
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  
  resources :sessions, only: :create
  resources :lessons do
    resources :answers
  end
  resources :users do
    member do
      get :following, :followers, :words_learned
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
