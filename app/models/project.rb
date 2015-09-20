class Project < ActiveRecord::Base
  belongs_to :city
  belongs_to :category
  has_many :users, :through => :users_projects
  has_many :users_projects
  has_many :events
  has_many :uploads
  has_many :participants, :through => :participations, :class_name => 'User'
  has_many :participations
  accepts_nested_attributes_for :users, :users_projects, :participants, :participations
  
  def has_view_permission?(user)
    if !is_private || (!user.nil? && (participations.where(:status => 0).collect{ | part | part.user }.include?(user) || user.try(:admin?)))
      return true
    else
      return false
    end
  end
  
  def has_edit_permission?(user)
    if !user.nil? && (users.include?(user) || user.try(:admin?))
      return true
    else
      return false
    end
  end
  
end
