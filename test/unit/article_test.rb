require_relative '../test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  fixtures :articles, :categories
  
  def setup
    @article = articles(:one)
  end

  test "initialize" do
    assert_equal "Awesome title", @article.title
    assert_equal "Look just because I don't be givin no man a foot massage", @article.body
    assert_equal "Brad Graham", @article.author.name
  end

  test "category names" do
    @article.categories = categories(:html)
    actual = @article.category_names
    assert_equal "foo bar", actual
  end
  
  test "create article without requirements" do
    article = Article.new
    assert !article.save, "Saved an article without any validations"
  end
  
  test "there are validations" do
    assert(@article.valid?, "Fixtured article not passing validations")
  end
  
  test "title presence" do
    @article.title = nil
    assert(!@article.valid?, "Title should be required")
  end

  test "title length" do  
    @article.title = "a" * 141
    assert(!@article.valid?, "Title should be have a limit of 140 characters")
  end
  
  test "author id presence" do
    @article.author_id = nil
    assert(!@article.valid?, "Author should be passing")
  end
  
  test "body presence" do
    @article.body = nil
    assert(!@article.valid?, "Body should be required")
  end

  test "article to param" do
    assert_equal "#{@article.id}-awesome-title", @article.to_param
  end
  
end