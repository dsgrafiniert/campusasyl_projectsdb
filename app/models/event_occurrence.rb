class EventOccurrence < ActiveRecord::Base
  has_many :users, -> { distinct }, :through => :attends
  has_many :attends
  
  def event
    Event.find(self.schedulable_id)
  end
  
  def remaining_free_places
    event.required_people-attends.count
  end
end
