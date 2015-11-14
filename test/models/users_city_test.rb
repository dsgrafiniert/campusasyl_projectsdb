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

require 'test_helper'

class UsersCityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
