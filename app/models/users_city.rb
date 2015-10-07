class UsersCity < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  enum status: [:leader, :regular]
  
end
