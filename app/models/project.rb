class Project < ActiveRecord::Base
  belongs_to :city
  belongs_to :category
  has_many :users, -> { distinct }, :through => :users_projects
  has_many :users_projects
  has_many :events
  has_many :uploads
  has_many :participants, :through => :participations, :class_name => 'User'
  has_many :participations
  accepts_nested_attributes_for :users, :users_projects, :participants, :participations
  acts_as_taggable_on :skills, :language_skills, :studies, :working_experiences
  attr_accessor :new_skill, :new_language_skill, :new_study, :new_working_experience
  
  def has_view_permission?(user)
    if !is_private || (!user.nil? && (participations.where(:status => 0).collect{ | part | part.participant }.include?(user) || user.try(:admin?)))
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
