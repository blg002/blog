class ArticlesController < ApplicationController
  before_filter :get_article, only: [:show, :edit, :update, :destroy]
  
  def get_article
    @article = Article.find(params[:id])
  end
  
  # GET /posts
  def index
    @articles = Article.all
  end
  
  # GET /posts/1
  def show
  end
  
  # GET /posts/new
  def new
    @article = Article.new
  end
  
  # POST /posts
  def create
    @article = Article.new(params[:article])
    
    if @article.save
      redirect_to @article, notice: "Article successfully created"
    else
      render action: "new"
    end
  end
  
  # PUT /posts/1
  def update
    @article.update_attributes(params[:article])
    
    redirect_to @article
  end
  
  # DELETE /posts/1
  def destroy
    @article.destroy
    flash[:notice] = "Article gone!"
    redirect_to articles_url
  end
end