class QuestionsController < ApplicationController
  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new(question_params.merge(correct_answer: params[:correct_answer][:text], wrong_answers: params[:wrong_answers]))
    @question.quiz = @quiz
    if @question.save
      redirect_to quiz_path(@quiz)
      flash[:notice] = "Question successfully added"
    else
      render 'quizzes/show'
    end
  end

  def edit
    question = Question.includes(:answers).find(params[:id])
    if question.user == current_user
      @question = question
    end
  end

  def update
    question = Question.includes(:answers, :quiz).find(params[:id])
    if question.user == current_user
      @question = question
    end
    if @question.update(question_params.merge(correct_answer: params[:correct_answer][:text], wrong_answers: params[:wrong_answers]))
      redirect_to quiz_path(@question.quiz)
      flash[:notice] = "Question updated"
    else
      render :edit
    end
  end

  def destroy
    question = Question.includes(:quiz).find(params[:id])
    if question.user == current_user
      @question = question
    end
    if @question.destroy
      redirect_to quiz_path(@question.quiz)
      flash[:notice]="Question deleted"
    else
      render 'quizzes/show'
      flash[:alert]="An error occurred. Please try again later."
    end
  end

  def question_params
    params.require(:question).permit(:text, :correct_answer['text'], :wrong_answers[0], :wrong_answers[1], :wrong_answers[2])
  end
end
