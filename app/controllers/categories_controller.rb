class CategoriesController < ApplicationController
  before_filter :get_category, only: [:show, :edit, :update, :destroy]
  
  def get_category
    @category = Category.find(params[:id])
  end
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to @category, notice: "Category successfully created"
    else
      render action: "new"
    end
  end

  def update
    @category.update_attributes(params[:name])

    redirect_to @category
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category gone!"
    redirect_to categories_url
  end
end