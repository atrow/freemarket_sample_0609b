Rails.application.routes.draw do
root 'products#index'

get 'index', to: 'products#index'

end
