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

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
