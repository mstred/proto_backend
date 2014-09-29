json.array!(@technicians) do |technician|
  json.extract! technician, :id, :name, :email, :password, :gcm_id , :location
  json.url technician_url(technician, format: :json)
end
