# == Schema Information
#
# Table name: participations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  status     :integer
#  invitationHash :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participation < ActiveRecord::Base
  enum status: [:approved, :applied, :invited]
  
  belongs_to :participant, :foreign_key => :user_id, :class_name => 'User'
  belongs_to :project
  
  def generate_token
    self.invitationHash = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(invitationHash: random_token)
    end
  end
  
end
