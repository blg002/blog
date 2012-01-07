class Author < ActiveRecord::Base
  validates :name,      :presence => true
  validates :email,     :presence => true
  validates :user_name, :presence => true,
                        :uniqueness => true
  validates :password,  :presence => true,
                        :length => { :minimum => 7 }

  attr_accessible :name, :user_name, :email, :password

  has_many :articles, dependent: :destroy

  attr_accessor :password
  before_save :encrypt_password
  
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