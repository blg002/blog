require 'test_helper'

class ArticleMailerTest < ActionMailer::TestCase
  test "article_published" do
    mail = ArticleMailer.article_published
    assert_equal "Article published", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
