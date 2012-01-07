class Article < ActiveRecord::Base
  validates :title,   :presence => true,
                      :length => { :maximum => 140 }
  validates :author_id, :presence => true
  validates :body,    :presence => true
  
  belongs_to :author
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
end