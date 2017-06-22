class CategoriesController < ApplicationController
  def index
  	@categories=Category.all
  end

  def edit
  end

  def new
  end

  def show
  	@categories=Category.find(params[:id])
  	@posts=@categories.posts
  end
end
