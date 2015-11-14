# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  tag_id        :integer
#  taggable_id   :integer
#  taggable_type :string
#  tagger_id     :integer
#  tagger_type   :string
#  context       :string(128)
#  created_at    :datetime
#

class Tagging < ActiveRecord::Base
  belongs_to :tag
end
