Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
