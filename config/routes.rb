Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home/index'
  devise_for :views
  root to: "home#index"

  resources :profiles, only: [:new, :create]
end
