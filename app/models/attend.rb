class Attend < ActiveRecord::Base
  enum status: [:leader, :newbie, :regular]
  belongs_to :user
  belongs_to :event_occurrence
end
