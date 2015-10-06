module CitiesHelper
  
  def invite_city_path(city)
    "/cities/#{city.id}/invite/#{city.invitationHash}"
  end
  
end
