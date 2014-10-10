require 'rails_helper'

feature 'add a new element', focus: true do

  before(:each) do
    @quiz = FactoryGirl.create(:quiz)
    sign_in_as (@quiz.course.user)
  end

  scenario 'add a question' do
    question = FactoryGirl.build(:question)
    correct_answer = FactoryGirl.build(:answer, text: "correct answer", question: question)
    wrong_answers = FactoryGirl.build_list(:answer, 3, question: question)
    visit quiz_path(@quiz)

    save_and_open_page

    fill_in "Question text", with: question.text
    fill_in "Correct Answer", with: correct_answer.text
    fill_in 'wrong_answers_0_text', with: wrong_answers[0].text
    fill_in 'wrong_answers_1_text', with: wrong_answers[1].text
    fill_in 'wrong_answers_2_text', with: wrong_answers[2].text

    click_button "Create Question"

    expect(page).to have_content(question.text)
    question.answers.each do |answer|
      expect(page).to have_content(answer.text)
    end
  end
end
