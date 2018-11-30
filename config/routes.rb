Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :coffees do
    resources :purchases, only: [:new, :create]
    member do
      resources :reviews, only: [:create]
    end
  end

  resources :reviews, only: [:edit, :update]
  resources :purchases, only: [:index, :show]
  resources :pages, only: [:index]
  get 'knowledge', to: "pages#knowledge", as: :knowledge
end
