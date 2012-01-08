class Category < ActiveRecord::Base
  validates :name, :presence => true,
                   :uniqueness => true
  
  has_many :categorizations, dependent: :destroy
  has_many :articles, through: :categorizations
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
end