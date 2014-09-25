json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :email, :device_model, :password
  json.url customer_url(customer, format: :json)
end
