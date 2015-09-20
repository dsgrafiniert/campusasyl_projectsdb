json.array!(@cities) do |city|
  json.extract! city, :id, :title
  json.url city_url(city, format: :json)
end
