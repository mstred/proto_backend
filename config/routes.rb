Rails.application.routes.draw do

  root 'home#index'

  #Routes for api
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :locations , only: [:index, :show, :update]
      
      resources :technicians do
        resources :ratings, except: [:update, :destroy, :show ,:new, :edit]
      end      
      
      resources :ratings, only: [:update, :destroy]
      resources :customers

      get 'technicians/location/:id' => 'technicians#technician_location' , as: 'technician_location'
      get 'customers/location/:id' => 'customers#customer_location' , as: 'customer_location'
      post '/message/technician/:technician_id' => 'message#message_technician', as: 'message_technician' 
      post '/message/customer/:customer_id' => 'message#message_customer', as: 'message_customer'

      post 'customers/login' => 'customers_login#login' , as: 'customers_login'
    end
  end

  #Routes for browser application
  resources :locations , only: [:index, :show, :update]

  resources :technicians do
    resources :ratings, except: [:update, :destroy, :show ,:new, :edit]
  end

  resources :ratings, only: [:update, :destroy]
  resources :customers

  devise_for :users

  get 'technicians/location/:id' => 'technicians#technician_location' , as: 'technician_location'
  get 'customers/location/:id' => 'customers#customer_location' , as: 'customer_location'
  post '/message/technician/:technician_id' => 'message#message_technician', as: 'message_technician' 
  post '/message/customer/:customer_id' => 'message#message_customer', as: 'message_customer'

end
