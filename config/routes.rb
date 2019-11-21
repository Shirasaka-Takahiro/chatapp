Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'

  resources :room, only: %i[:show]

end
