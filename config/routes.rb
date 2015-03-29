Rails.application.routes.draw do
  #mount Upmin::Engine => '/admin'

  devise_for :users

  namespace :admin do
    resources :missions
  end

  resources :missions, only: :index
  resources :users

  root to: 'missions#index'
end
