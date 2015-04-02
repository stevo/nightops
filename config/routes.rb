Rails.application.routes.draw do
  #mount Upmin::Engine => '/admin'

  devise_for :users

  namespace :admin do
    resources :missions do
      resources :invitations, only: [:create, :destroy]
    end

    resources :teams
  end

  resources :missions, only: :index do
    resource :participation, only: [:create, :update]
  end

  resources :teams, only: :show do
    resources :memberships, only: [:create, :destroy]
  end


  resources :users

  root to: 'missions#index'
end
