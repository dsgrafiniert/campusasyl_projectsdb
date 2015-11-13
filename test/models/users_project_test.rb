# == Schema Information
#
# Table name: users_projects
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UsersProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
