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

require 'test_helper'

class CityParticipationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
