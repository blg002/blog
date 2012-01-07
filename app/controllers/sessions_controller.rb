class SessionsController < ApplicationController
  skip_before_filter :current_author?
  
  def new
  end

  def create
    author = Author.authenticate(params[:user_name], params[:password])
    
    if author
      session[:author_id] = author.id
      redirect_to root_url, notice: "Signed in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:author_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end