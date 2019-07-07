Rails.application.routes.draw do


  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :create, :edit, :update] do
    resources :product_pictures, only: [:new, :create, :edit, :update]
  end
end
