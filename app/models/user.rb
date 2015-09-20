class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  acts_as_taggable_on :skills
  
  def set_default_role
    self.role ||= :user
  end
  
  def email_required?
    false
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

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
         
  private
    def process_uri(uri)
      require 'open-uri'
      require 'open_uri_redirections'
      open(uri, :allow_redirections => :safe) do |r|
        r.base_uri.to_s
      end
    end
end
