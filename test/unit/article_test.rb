require_relative '../test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  def setup
    @article = articles(:one)
  end
  
  test "create article without requirements" do
    article = Article.new
    assert !article.save, "Saved an article without any validations"
  end
  
  test "validations" do
    assert(@article.valid?, "Article not passing validations")
    
    @article.title = nil
    assert(!@article.valid?, "Title should be required")
    
    @article.author_id = nil
    assert(!@article.valid?, "Author should be passing")
    
    @article.body = nil
    assert(!@article.valid?, "Body should be required")
  end

  test "article to param" do
    assert_equal "980190962-awesome-title", @article.to_param
  end
  
end