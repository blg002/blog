require 'test_helper'
require 'mocha'

class ArticleTest < ActiveSupport::TestCase
  
  def setup
    @article = articles(:one)
  end
  
  test "create article without requirements" do
    article = Article.new
    assert !article.save, "Saved an article without any validations"
  end
  
  # test "validations" do
  #   assert(@article.valid?)
  #   
  #   @article.title = nil
  #   assert(!@article.valid?)
  #   
  #   @article.title = "A title much longer than 140 character!! A title much longer than 140 character!! A title much longer than 140 character!! A title much longer than 140 character!!"
  #   assert(!@article.valid?)
  #   
  #   @article.author_id = nil
  #   assert(!@article.valid?)
  #   
  #   @article.body = nil
  #   assert(!@article.valid?)
  # end
  
end