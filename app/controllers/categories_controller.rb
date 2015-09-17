class CategoriesController < ApplicationController
	  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def categories
    @categories = Category.all
  end

  def create
    @categories = Category.new
  end

  def show
    @categories = Category.find(params[:id])
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def create
    @categories = Category.new(categories_params)

    if @categories.save
      redirect_to [@categories]
    else
      render :new
    end
  end
  
  def update
    @categories = Category.find(params[:id])

    if @categories.update(categories_params)
      flash[:notice] = "Categories was updated."
      redirect_to @categories
    else
      flash[:error] = "Error! Please try again."
      render :new
    end
  end

  def destroy
    @categories = Category.find(params[:id])

    if @categories.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @categories
    else
      flash[:error] = "There was an error deleting the categories."
      render :show
    end
  end

  private

  def categories_params
    params.require(:categories).permit(:categories)
  end
	end
end
