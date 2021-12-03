Rails.application.routes.draw do
  get 'users/new'
  get 'user/new'
  root "pages#home"
  get '/about', to:'pages#about'
  get '/contact', to:'pages#contact'
  resources :users
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
