class LessonsController < ApplicationController
  def index 
    @categories = Category.paginate(page: params[:page], per_page: 10).order(created_at: :desc) 
  end
  def create
    category = Category.find(params[:category])
    lesson = category.lessons.new(user_id: params[:user])
    if category.words.any?
      if lesson.save
        redirect_to new_lesson_answer_path(lesson)
      end
    else
      flash[:danger] = "There are no words available"
      redirect_to lessons_path
    end
  end
  def show
    @lesson = Lesson.find(params[:id])
  end
  
end
