class Participation < ActiveRecord::Base
  enum status: [:approved, :applied]
  
  belongs_to :participant, :foreign_key => :user_id, :class_name => 'User'
  belongs_to :project
end
