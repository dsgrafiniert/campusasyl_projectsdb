class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name, :presence => true
  validates :email, :presence => true
  acts_as_taggable_on :skills, :language_skills, :study, :working_experience
  attr_accessor :new_skill, :new_language_skill, :new_study, :new_working_experience
  
  has_many :projects, :through => :users_projects
  has_many :users_projects
  has_many :event_occurrences, :through => :attends
  has_many :attends
  
  def set_default_role
    self.role ||= :user
  end
  
  def email_required?
    true
  end

  def email_changed?
    false
  end
  
  def set_avatarimage(uri)
    avatar_url = process_uri(uri+"?type=large")
    update_attribute(:avatar, URI.parse(avatar_url))
  end
  
  def self.from_omniauth(auth)
    result = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      
     # user.image = auth.info.image # assuming the user model has an image
    end
    if auth.info.image.present?
       result.set_avatarimage(auth.info.image)
    end
    result
  end
  
  def may_see_telephone?(user)
     if !user.nil? && (projects.collect{|p| p.city}.collect{|c| c.projects}.flatten.collect{|p| p.users}.flatten.include?(user) || user.try(:admin?))
       return true
     else
       return false
     end
   end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
         
  private
    def process_uri(uri)
      require 'open-uri'
      require 'open_uri_redirections'
      open(uri, :allow_redirections => :safe) do |r|
        r.base_uri.to_s
      end
    end
end
