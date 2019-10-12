Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get "registrations/new" => "registrations#new"
  get "products/search" => "products#search"

  resources :users, only: [:show, :new, :create, :edit, :update]
  root 'products#index'
  resources :products, only: [:index, :new, :create, :edit, :update, :show, :destroy], shallow: true do
    resources :images, only: [:new, :create, :edit, :update]
    resources :purchases, only: [:new, :create, :edit, :update]
  end
end
