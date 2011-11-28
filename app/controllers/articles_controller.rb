class ArticlesController < ApplicationController
  
  before_filter :get_tweet, :only => [:show, :edit, :update, :destroy]
  
  def get_tweet
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end

  def show
    
  end
  
  def new
    @article = Article.new
  end
  
  def edit

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