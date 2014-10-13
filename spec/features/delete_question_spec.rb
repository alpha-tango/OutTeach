require "rails_helper"

feature 'user deletes a question', focus: true do
  scenario 'delete question' do
    question = FactoryGirl.create(:question)
    sign_in_as(question.user)
    visit quiz_path(question.quiz)

    click_link "DELETE QUESTION"

    expect(page).to have_content("Question deleted")
    expect(page).to_not have_content(question.text)
    question.answers.each do |answer|
      expect(page).to_not have_content(question.answer.text)
    end
  end
end
