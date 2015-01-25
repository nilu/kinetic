Rails.application.routes.draw do
  root 'users#index'

  devise_for :users

  resources :contacts

  namespace :api do
    get '/:user_id/contacts' => 'contacts#index'
    resources :users
  end
end
