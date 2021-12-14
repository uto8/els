class Admin::CategoriesController < ApplicationController
  before_action :admin_user, only: :home
  before_action :logged_in_user
  def new
    @category=Category.new
  end
  def create
    @category = Category.new(category_params)
     if @category.save
      flash[:success] = "Successfully Created account"
      redirect_to admin_categories_path
     else
      render "new"
     end
  end
  def index
    @categories =Category.paginate(page: params[:page], per_page: 10).order(created_at: :desc) 
  end

  def edit
    @category=Category.find(params[:id])
  end
  def update
    @category=Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category Updated"
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end
  def destroy
    @category=Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end
  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
