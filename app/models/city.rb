# == Schema Information
#
# Table name: cities
#
#  id             :integer          not null, primary key
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  invitationHash :string
#

class City < ActiveRecord::Base
  has_many :users, -> { distinct }, :through => :users_cities
  has_many :users_cities
  has_many :projects
  has_many :participants, :through => :city_participations, :class_name => 'User'
  has_many :city_participations

  accepts_nested_attributes_for :users, :users_cities, :participants, :city_participations

  before_create :generate_token

  def generate_token
    self.invitationHash = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(invitationHash: random_token)
    end
  end

end
