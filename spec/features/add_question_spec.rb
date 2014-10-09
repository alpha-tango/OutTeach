require 'rails_helper'

feature 'add a new element', focus: true do

  before(:each) do
    @quiz = FactoryGirl.create(:quiz)
    sign_in_as (@quiz.course.user)
  end

  scenario 'add a question' do
    question = FactoryGirl.build(:question)
    visit quiz_path(@quiz)

    fill_in "Text", with: question.text
    fill_in "Correct Answer", with: question.correct_answer
    fill_in "First Wrong Answer", with: question.wrong_answers.pop.text
    fill_in "Second Wrong Answer", with: question.wrong_answer.pop.text
    fill_in "Third Wrong Answer", with: question.wrong_answer.text

    expect(page).to have_content(question.text)
    question.answers.each do |answer|
      expect(page).to have_content(answer.text)
    end
  end
end
