# == Schema Information
#
# Table name: participations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participation < ActiveRecord::Base
  enum status: [:approved, :applied]
  
  belongs_to :participant, :foreign_key => :user_id, :class_name => 'User'
  belongs_to :project
end
