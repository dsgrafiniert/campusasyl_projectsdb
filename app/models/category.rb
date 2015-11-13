# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :children, :dependent => :destroy, :class_name => 'Category'

  belongs_to :category
end
