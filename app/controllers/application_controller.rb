class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_author
  before_filter :current_author?, :only => [:new, :create, :update, :destroy]

  def current_author?
    unless current_author
      redirect_to root_url, :notice => "Please sign in"
    end
  end
  
  private
  
  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end
end