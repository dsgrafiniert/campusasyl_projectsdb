module EventOccurrenceHelper
  
  def attend_event_occurrence_path(event)
    "/#{I18n.locale}/event_occurrences/#{event.id}/attend"
  end
  
  def decline_event_occurrence_path(event)
    "/#{I18n.locale}/event_occurrences/#{event.id}/decline"
  end
  
  def my_events_path
    "/#{I18n.locale}/my/event_occurrences"
  end
  
end
