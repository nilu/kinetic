Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  namespace :api do
    resources :users, :contacts
  end
end
