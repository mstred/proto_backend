json.array!(@locations) do |location|
  json.extract! location, :id, :lat, :long, :locationable_id, :locationable_type
  json.url location_url(location, format: :json)
end
