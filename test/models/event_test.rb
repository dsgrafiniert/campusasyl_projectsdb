# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  date            :datetime
#  project_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  required_people :integer
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
