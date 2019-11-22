Rails.application.routes.draw do
  devise_for :users
  root to: 'top#show'

  resources :rooms 

  devise_scope :user do
    get 'users/sign_out', :to => 'users/sessions#destroy' 
  end

end
