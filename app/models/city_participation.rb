class CityParticipation < ActiveRecord::Base
    enum status: [:approved, :applied]

    belongs_to :participant, :class_name => 'User'
    
  belongs_to :city
end
