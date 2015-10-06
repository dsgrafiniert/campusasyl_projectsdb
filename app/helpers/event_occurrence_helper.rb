module EventOccurrenceHelper
  
  def attend_event_occurrence_path(event)
    "/event_occurrences/#{event.id}/attend"
  end
  
end
