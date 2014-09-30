json.array!(@ratings) do |rating|
  json.extract! rating, :id, :stars, :technician_id
  json.url rating_url(rating, format: :json)
end
