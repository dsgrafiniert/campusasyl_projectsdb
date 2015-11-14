# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :text
#  city_id         :integer
#  category_id     :integer
#  time            :datetime
#  urgent          :boolean
#  required_people :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_private      :boolean
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
