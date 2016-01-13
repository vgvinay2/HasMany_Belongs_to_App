Modeldemo::Application.routes.draw do
  root 'customers#index'

  resources :customers do
    resources :orders
  end

end
