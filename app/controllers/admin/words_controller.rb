class Admin::WordsController < ApplicationController
  before_action :admin_user, only: :home
  before_action :logged_in_user
  def index
    @category = Category.find(params[:category_id])
    @words=@category.words.paginate(page: params[:page], per_page: 10).order(created_at: :desc)    
  end
  def new
    @category = Category.find(params[:category_id])
    @word=@category.words.new
    3.times {
      @word.choices.build
    }
  end
  def create
    @category = Category.find(params[:category_id])
    @word=@category.words.new(word_params)
    if @word.save
      flash[:success] = "Successfully Created word"
      redirect_to admin_category_words_path(@category)
     else
      render "new"
     end
  end
  def edit
    @word = Word.find(params[:id])
    @category = Category.find(params[:category_id])
  end
  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    if @word.update(word_params)
      flash[:success] = "Word Updated"
      redirect_to admin_category_words_path(@category)
    else
      render 'edit'
    end
  end
  def destroy
    @category = Category.find(params[:category_id]);
    @word = @category.words.find(params[:id])
    @word.destroy
    redirect_to admin_category_words_path(@category)
  end
  private
  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :correct])
  end
end
