require 'bcrypt'

class User

  include DataMapper::Resource

  has n, :peeps, :through => Resource

  property :id,               Serial
  property :name,             String, :required => true 
  property :username,         String, :required => true, :unique => true 
  property :email,            String, :required => true, :unique => true 
  property :password_digest,  Text   

  attr_reader   :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end  


end