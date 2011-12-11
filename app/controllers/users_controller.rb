class UsersController < ApplicationController
  before_filter :get_user, :only => [:show, :edit, :update, :destroy]
  before_filter :current_user?, :only => [:new, :create, :update, :destroy]
  
  def get_user
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def current_user?
    unless current_user
      redirect_to root_url, :notice => "Please sign in"
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user
    end
  end

  def update
    @user.update_attributes(params[:user])

    redirect_to @user
  end

  def destroy
    @user.destroy
  end
end