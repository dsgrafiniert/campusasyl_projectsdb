module CitiesHelper
  
  def participate_city_path(city)
    "/cities/#{city.id}/participate"
  end
  
  def invite_city_path(city)
    "/cities/#{city.id}/invite/#{city.invitationHash}"
  end
  
end
