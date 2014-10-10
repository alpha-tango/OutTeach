class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @quiz = Quiz.find(params[:quiz_id])
    @question.quiz = @quiz
    @question.wrong_answers=(params['wrong_answers'])
    binding.pry

    if @question.save
      redirect_to quiz_path(@quiz)
      flash[:notice] = "Question successfully added"
    else
      render 'quizzes/show'
    end
  end

  def question_params
    params.require(:question).permit(:text, :correct_answer, :wrong_answers)
  end
end
