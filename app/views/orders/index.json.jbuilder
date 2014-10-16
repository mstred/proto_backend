json.array!(@orders) do |order|
  json.extract! order, :id, :uid, :description, :customer_id, :technician_id, :status
  json.url order_url(order, format: :json)
end
