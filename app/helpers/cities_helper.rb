module CitiesHelper
  
  def participate_city_path(city)
    "/#{I18n.locale}/cities/#{city.id}/participate"
  end
  
  def invite_city_path(city)
    "/#{I18n.locale}/cities/#{city.id}/invite/#{city.invitationHash}"
  end
  
end
