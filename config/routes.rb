Rails.application.routes.draw do

  resources :locations , only: [:index, :show, :update]

  resources :technicians do
    resources :ratings, except: [:update, :destroy, :show ,:new, :edit]
  end

  resources :ratings, only: [:update, :destroy]

  resources :customers

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get 'technicians/location/:id' => 'technicians#technician_location' , as: 'technician_location'

  get 'customers/location/:id' => 'customers#customer_location' , as: 'customer_location'

  post '/message/technician/:technician_id' => 'message#message_technician', as: 'message_technician' 
  post '/message/customer/:customer_id' => 'message#message_customer', as: 'message_customer'

end
