Rails.application.routes.draw do
  root 'contacts#index'

  devise_for :users

  resources :contacts

  namespace :api do
    get '/users' => 'users#index'
    resources :contacts
  end
end
