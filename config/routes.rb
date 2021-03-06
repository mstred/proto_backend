Rails.application.routes.draw do

  resources :orders

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
      resources :orders
      #Location
      get 'technicians/location/:id' => 'technicians#technician_location' , as: 'technician_location'
      get 'customers/location/:id' => 'customers#customer_location' , as: 'customer_location'
      
      #Messaging
      post '/message/technician/:technician_id' => 'message#message_technician', as: 'message_technician' 
      post '/message/customer/:customer_id' => 'message#message_customer', as: 'message_customer'

      #Login
      post 'customers/login' => 'customers_login#login' , as: 'customers_login'
      post 'technicians/login' => 'technicians_login#login' , as: 'technicians_login'
    end
  end

  #Routes for browser application
  resources :locations , only: [:index, :show, :update]

  resources :technicians do
    resources :ratings, except: [:update, :destroy, :show ,:new, :edit]
  end

  resources :ratings, only: [:update, :destroy]
  resources :customers
  resources :orders
  devise_for :users

  #Location
  get 'technicians/location/:id' => 'technicians#technician_location' , as: 'technician_location'
  get 'customers/location/:id' => 'customers#customer_location' , as: 'customer_location'
  
  #Messaging
  post '/message/technician/:technician_id' => 'message#message_technician', as: 'message_technician' 
  post '/message/customer/:customer_id' => 'message#message_customer', as: 'message_customer'
end
