Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }
  get 'home/index'
  devise_for :views
  root to: "home#index"

  resource :profile, only: [:new, :create, :update, :edit]
end
