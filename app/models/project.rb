# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :text
#  city_id         :integer
#  category_id     :integer
#  time            :datetime
#  urgent          :boolean
#  required_people :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_private      :boolean
#

class Project < ActiveRecord::Base
  acts_as_taggable_on :skills, :language_skills, :studies, :working_experiences
  attr_accessor :new_skill, :new_language_skill, :new_study, :new_working_experience

  accepts_nested_attributes_for :users, :users_projects, :participants, :participations

  has_many :users, -> { distinct }, :through => :users_projects
  has_many :users_projects
  has_many :events
  has_many :uploads
  has_many :participants, :through => :participations, :class_name => 'User'
  has_many :participations

  belongs_to :city
  belongs_to :category

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
