Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :coffees
  resources :purchases
  resources :pages, only: [:index]
end
