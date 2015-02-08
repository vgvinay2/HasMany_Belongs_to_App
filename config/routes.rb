Modeldemo::Application.routes.draw do

  resources :customers do
    resources :orders
  end
  root 'customers#index'

end
