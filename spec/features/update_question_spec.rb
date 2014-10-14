require 'rails_helper'

feature 'update a question' do

  before(:each) do
    @question = FactoryGirl.create(:question)
    @correct_answer = FactoryGirl.create(:answer, text: "correct answer", question: @question, correct: true)
    @wrong_answers = FactoryGirl.create_list(:answer, 3, question: @question)
    sign_in_as (@question.user)
  end

  scenario 'update question with valid information' do
    visit edit_question_path(@question)

    fill_in "Question text", with: "new text"
    fill_in "Correct Answer", with: "correcter answer"
    fill_in 'wrong_answers_0_text', with: "so wrong 1"
    fill_in 'wrong_answers_1_text', with: "so wrong 2"
    fill_in 'wrong_answers_2_text', with: "so wrong 3"

    click_button "UPDATE QUESTION"

    expect(page).to have_content("updated")
    expect(page).to have_content("new text")
    expect(page).to have_content("correcter answer")
    expect(page).to have_content("so wrong 1")
    expect(page).to have_content("so wrong 2")
    expect(page).to have_content("so wrong 3")

    expect(page).to_not have_content(@question.text)
    expect(page).to_not have_content(@correct_answer.text)
    @wrong_answers.each do |answer|
      expect(page).to_not have_content(answer.text)
    end
  end
end
