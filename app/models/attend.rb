# == Schema Information
#
# Table name: attends
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  event_occurrence_id :integer
#

class Attend < ActiveRecord::Base
  enum status: [:leader, :newbie, :regular]
  belongs_to :user
  belongs_to :event_occurrence
end
