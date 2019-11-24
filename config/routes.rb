Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  # resources :users, only: [:show, :edit, :update]
  
  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }


  root to: 'top#show'

  resources :rooms 

  devise_scope :user do
    get 'users/sign_out', :to => 'users/sessions#destroy' 
  end

  resources :users, :only => [:index, :show, :edit, :destroy]

end
