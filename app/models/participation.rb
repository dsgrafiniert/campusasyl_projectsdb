class Participation < ActiveRecord::Base
  enum status: [:approved, :applied]
  
  belongs_to :user
  belongs_to :project
end
