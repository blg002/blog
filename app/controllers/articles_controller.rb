class ArticlesController < ApplicationController
  before_filter :get_article, :only => [:show, :edit, :update, :destroy]
  before_filter :current_user?, :only => [:new, :create, :update, :destroy]
  
  def get_article
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end

  def current_user?
    unless current_user
      redirect_to root_url, :notice => "Please sign in"
    end
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    
    if @article.save
      redirect_to @article
    end
  end
  
  def update
    @article.update_attributes(params[:article])
    redirect_to @article
  end
  
  def destroy
    @article.destroy
  end
end