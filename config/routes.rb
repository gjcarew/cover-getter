Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :views
  root to: "home#index"

  resources :profiles, only: [:new]
  resources :jobs, only: %i[show new create edit update]
end
