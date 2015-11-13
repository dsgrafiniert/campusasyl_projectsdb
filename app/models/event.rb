# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  date            :datetime
#  project_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  required_people :integer
#

class Event < ActiveRecord::Base
  acts_as_schedulable :schedule, occurrences: :event_occurrences

  belongs_to :project
end
