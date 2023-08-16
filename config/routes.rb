Rails.application.routes.draw do
  root 'purchase_orders#index'

  get '404' => 'errors#not_found'
  get '500' => 'errors#internal_server_error'

  resources :order_items
  resources :items
  resources :purchase_orders
end
