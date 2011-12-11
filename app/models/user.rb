class User < ActiveRecord::Base
  attr_accessible :user_name, :password

  attr_accessor :password
  before_save :encrypt_password
  
  validates :name,      :presence => true
  validates :user_name, :presence => true,
                        :uniqueness => true
  validates :password,  :presence => true
  
  has_many :articles
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  def self.authenticate(user_name, password)
    user = find_by_user_name(user_name)
    
    if user && user.hashed_password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
end