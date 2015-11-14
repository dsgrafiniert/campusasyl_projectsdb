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
  enum status: [:leader, :regular]

  belongs_to :user
  belongs_to :city
end
