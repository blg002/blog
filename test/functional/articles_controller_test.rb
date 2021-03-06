require_relative '../test_helper'

class ArticlesControllerTest < ActionController::TestCase
  
  fixtures :articles, :authors
  
  setup do
    @article = articles(:one)
    login_as authors(:brad)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: { title: 'Howdy', body: 'Some body copy', author_id: 1 }
    end

    assert_redirected_to article_path(assigns(:article))
    assert_equal 'Article successfully created.', flash[:notice]
  end

  test "should show article" do
    get :show, id: @article.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article.to_param
    assert_response :success
  end

  test "should update article" do
    put :update, id: @article.to_param, article: @article.attributes
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article.to_param
    end

    assert_redirected_to articles_url
  end
  
end