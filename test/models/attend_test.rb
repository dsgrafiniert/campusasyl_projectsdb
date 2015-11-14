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

require 'test_helper'

class AttendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
