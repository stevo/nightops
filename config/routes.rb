Rails.application.routes.draw do
  #mount Upmin::Engine => '/admin'

  devise_for :users

  resources :missions
  resources :users

  root to: 'missions#index'
end
