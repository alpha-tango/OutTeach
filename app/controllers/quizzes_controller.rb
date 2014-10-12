class QuizzesController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @quiz = Quiz.new(quiz_params)
    @quiz.course = @course

    if @quiz.save
      flash[:notice] = "Quiz successfully created!"
      redirect_to quiz_path(@quiz)
    else
      @assignment = Assignment.new
      render 'courses/show'
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
    # @question = Question.build_new
  end
end
