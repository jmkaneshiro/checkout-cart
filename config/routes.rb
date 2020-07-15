Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show, :new, :create, :edit, :update]
  resources :inventory_items, only: [:index, :show, :create, :destroy]

  root 'products#index'
end
