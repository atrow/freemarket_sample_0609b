Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get "users/new" => "users#new"
  resources :users, only: [:show, :new, :create, :edit, :update]
  root 'products#index'
  resources :products, only: [:index, :new, :create, :edit, :update] do
    resources :images, only: [:new, :create, :edit, :update]
    resources :purchases, only: [:new, :create, :edit, :update]
  end
end
