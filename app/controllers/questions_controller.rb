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

  def question_params
    params.require(:question).permit(:text, :correct_answer['text'], :wrong_answers[0], :wrong_answers[1], :wrong_answers[2])
  end
end
