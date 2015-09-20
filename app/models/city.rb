class City < ActiveRecord::Base
  
  has_many :users, :through => :users_cities
   has_many :users_cities
   has_many :projects
   accepts_nested_attributes_for :users, :users_cities
  
end
