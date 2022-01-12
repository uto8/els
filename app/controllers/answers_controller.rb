class AnswersController < ApplicationController
  def index
  end

  def new
    @lesson = Lesson.find(params[:lesson_id]) 
    @category= @lesson.category
    @answer = @lesson.answers.new
    unless @lesson.next_word.nil?
      @word = @lesson.next_word
    else
      lesson = Lesson.find(params[:lesson_id])
      lesson.result = lesson.lesson_result
      if lesson.save
        redirect_to lesson_path(lesson)
      end 
    end

  end
  def create
    @lesson = Lesson.find(params[:lesson_id]) 
    @category= @lesson.category
    @answer = @lesson.answers.new(answer_params)
    if @answer.save
      redirect_to new_lesson_answer_path(@lesson)
    else
      abort
    end
  end
  
  private
  def answer_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
end
