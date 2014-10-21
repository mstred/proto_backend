json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :email, :device_model, :gcm_id, :location, :access_token
  json.url customer_url(customer, format: :json)
end
