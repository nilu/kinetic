Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users

  namespace :api do
    get '/users' => 'users#index'
    resources :contacts
  end
end
