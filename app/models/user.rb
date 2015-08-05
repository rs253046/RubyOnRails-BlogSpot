class User < ActiveRecord::Base
attr_accessor :password
validates_presence_of :password
validates_presence_of :email


validates_confirmation_of :password
before_save :encrypt_password


has_many :articles, dependent: :destroy

has_many :upvotes, :through => :articles
has_many :comments, :through => :articles

def encrypt_password
  self.password_salt = BCrypt::Engine.generate_salt
  self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
end



def self.authenticate(email, password)
user = User.where(email: email).first
if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
user
else
nil
end
end
end