require "rails_helper"

feature 'user deletes a quiz' do
  scenario 'delete quiz' do
    quiz = FactoryGirl.create(:quiz)
    sign_in_as(quiz.user)
    visit quiz_path(quiz)

    click_link "Delete quiz"

    expect(page).to have_content("Quiz deleted")
    expect(page).to_not have_content(quiz.title)
  end
end
