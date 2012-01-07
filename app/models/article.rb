class Article < ActiveRecord::Base
  validates :title,     :presence => true,
                        :length => { :maximum => 140 }
  validates :author_id, :presence => true
  validates :body,      :presence => true
  
  belongs_to :author
  has_many   :categorizations, dependent: :destroy
  has_many   :categories, through: :categorizations
  
  attr_writer :category_names
  after_save :assign_categories
  
  def category_names
    @category_names ||= categories.map(&:name).join(', ')
  end
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  private
  
  def assign_categories
    if @category_names
      self.categories = @category_names.split(', ').map do |name|
        Category.find_or_create_by_name(name)
      end
    end
  end
end