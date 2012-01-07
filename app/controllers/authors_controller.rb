class AuthorsController < ApplicationController
  before_filter :get_author, :only => [:show, :edit, :update, :destroy]
  
  def get_author
    @author = Author.find(params[:id])
  end
  
  def index
    @authors = Author.includes(:articles).all
  end
  
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params[:author])

    if @author.save
      redirect_to @author, notice: "Author successfully created"
    else
      render action: "new"
    end
  end

  def update
    @author.update_attributes(params[:author])

    redirect_to @author
  end

  def destroy
    @author.destroy
    flash[:notice] = "Author gone!"
    redirect_to authors_url
  end
end