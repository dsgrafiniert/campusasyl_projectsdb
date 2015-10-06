class Event < ActiveRecord::Base
  belongs_to :project
  
  acts_as_schedulable :schedule, occurrences: :event_occurrences
  
end
