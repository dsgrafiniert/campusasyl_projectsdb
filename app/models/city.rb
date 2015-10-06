class City < ActiveRecord::Base
  
  has_many :users, :through => :users_cities
   has_many :users_cities
   has_many :projects
   accepts_nested_attributes_for :users, :users_cities
   
   before_create :generate_token
   
     def generate_token
       self.invitationHash = loop do
         random_token = SecureRandom.urlsafe_base64(nil, false)
         break random_token unless self.class.exists?(invitationHash: random_token)
       end
     end
   
end
