class LessonsController < ApplicationController
  def index 
    @categories = Category.paginate(page: params[:page], per_page: 10).order(created_at: :desc) 
  end
  def create
    category = Category.find(params[:category])
    create_lesson = category.lessons.new(user_id: params[:user])
    @lesson = current_user.lessons.find_by(category_id: category.id)
    if category.words.any?
      unless @lesson
        create_lesson.save
        redirect_to new_lesson_answer_path(create_lesson)
      else
        redirect_to new_lesson_answer_path(@lesson)
      end
    else
      flash[:danger] = "There are no words available"
      redirect_to lessons_path
    end
  end
  def show
    @lesson = Lesson.find(params[:id])
    @category=Category.find(@lesson.category_id)
    @words = @category.words.all
    @answers = @lesson.answers.all  
  end
  
end
