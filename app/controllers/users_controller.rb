class UsersController < ApplicationController
  before_filter :get_user, :only => [:show, :edit, :update, :destroy]
  
  def get_user
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, notice: "User successfully created"
    else
      render action: "new"
    end
  end

  def update
    @user.update_attributes(params[:user])

    redirect_to @user
  end

  def destroy
    @user.destroy
    flash[:notice] = "User gone!"
    redirect_to user_url
  end
end