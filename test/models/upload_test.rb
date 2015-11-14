# == Schema Information
#
# Table name: uploads
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  project_id        :integer
#  name              :string
#  description       :text
#

require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
