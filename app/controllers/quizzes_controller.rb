class QuizzesController < ApplicationController
  def create
    @quiz = Quiz.new(quiz_params)
    @course = Course.find(params[:course_id])
    @quiz.course = @course

    if @quiz.save
      flash[:notice] = "Assignment successfully created!"
      redirect_to quiz_path(@quiz)
    else
      render :show
    end
  end

  def index
    @quiz = Quiz.all
  end

  def quiz_params
    params.require(:quiz).permit(:course_id, :title)
  end

  def show
    @quiz = Quiz.find(params[:id])
    @question = Question.new
  end
end
