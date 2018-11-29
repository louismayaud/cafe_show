Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :coffees do
    resources :purchases, only: [:new, :create]
    member do
      resources :reviews, only: [:new, :create]
    end
  end


  resources :purchases, only: [:index, :show]
  resources :pages, only: [:index]
end
