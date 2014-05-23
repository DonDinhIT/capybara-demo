json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :street, :city
  json.url restaurant_url(restaurant, format: :json)
end
