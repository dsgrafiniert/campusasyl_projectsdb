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

class Upload < ActiveRecord::Base
  has_attached_file :file, :styles => { :medium => ["300x300>", :png], :thumb => ["100x100#", :png] }, :default_url => "/images/:style/missing.png"
  do_not_validate_attachment_file_type :file
  belongs_to :project
  
  def is_image?
      return false unless file.content_type
      ['image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png', 'image/jpg'].include?(file.content_type)
  end
end
