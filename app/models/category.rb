class Category < ActiveRecord::Base
  belongs_to :category
    has_many :children, :dependent => :destroy, :class_name => 'Category'
  
end
