json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :city_id, :category_id, :time, :urgent, :required_people
  json.url project_url(project, format: :json)
end
