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

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.user == current_user && @quiz.update(quiz_params)
      redirect_to quiz_path(@quiz)
      flash[:notice] = "Quiz updated"
    else
      render :edit
    end
  end

  def show
    @quiz = Quiz.includes(:questions).find(params[:id])
    @question = Question.new
  end

  def destroy
    @quiz = Quiz.includes(:course).find(params[:id])
    if @quiz.user == current_user && @quiz.destroy
      redirect_to course_path(@quiz.course)
      flash[:notice] = "Quiz deleted"
    else
      render :show
    end
  end

  def score
    @quiz = Quiz.find(params[:id])

    if params[:quiz]
      tell_score = @quiz.score_answers(params[:quiz])
      flash[:alert] = tell_score
      render :show
    else
      flash[:alert] = "You haven't answered any questions yet!"
      render :show
    end
  end

  def quiz_params
    params.require(:quiz).permit(:course_id, :title)
  end
end
