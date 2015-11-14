# == Schema Information
#
# Table name: city_participations
#
#  id             :integer          not null, primary key
#  status         :integer
#  participant_id :integer
#  city_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class CityParticipation < ActiveRecord::Base
  enum status: [:approved, :applied]

  belongs_to :participant, :class_name => 'User'
  belongs_to :city
end
