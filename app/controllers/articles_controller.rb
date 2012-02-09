class ArticlesController < ApplicationController
  
  before_filter :get_article, only: [:show, :edit, :update, :destroy]
  
  def get_article
    @article = Article.find(params[:id])
  end
  
  # GET /articles
  def index
    @articles = Article.all
  end
  
  # GET /articles/1
  def show
  end
  
  # GET /articles/new
  def new
    @article = Article.new
  end
  
  # POST /articles
  def create
    @article = Article.new(params[:article])
    
    if @article.save
      # ArticleMailer.article_published(@article).deliver
      redirect_to @article, notice: "Article successfully created."
    else
      render action: "new"
    end
  end
  
  # PUT /articles/1
  def update
    @article.update_attributes(params[:article])
    
    redirect_to @article
  end
  
  # DELETE /articles/1
  def destroy
    @article.destroy
    
    respond_to do |format|
      format.html { 
        redirect_to articles_url
        flash[:notice] = "Article gone!"
      }
      format.js
    end
  end
  
end