# == Schema Information
#
# Table name: users_cities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer
#

class UsersCity < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  enum status: [:leader, :regular]
  
end
