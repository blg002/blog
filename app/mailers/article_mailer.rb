class ArticleMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.article_published.subject
  #
  
  def article_published(article)
    @article = article
    @author = @article.author

    mail to: @author.email, subject: 'Published: #{@article.title}'
  end
end
