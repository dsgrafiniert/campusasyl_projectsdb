# == Schema Information
#
# Table name: event_occurrences
#
#  id               :integer          not null, primary key
#  event_id         :integer
#  date             :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  schedulable_id   :integer
#  schedulable_type :integer
#

require 'test_helper'

class EventOccurrenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
