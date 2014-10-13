require 'rails_helper'

feature 'update a quiz' do
  before(:each) do
    @quiz = FactoryGirl.create(:quiz)
    sign_in_as(@quiz.user)
  end

  scenario 'update quiz with valid information' do
    visit edit_quiz_path(@quiz)

    fill_in "Title", with: "New  Quiz Title"

    click_button "UPDATE QUIZ"

    expect(page).to have_content("updated")
    expect(page).to have_content("New Quiz Title")
  end

  scenario 'update quiz with invalid information' do
    visit edit_quiz_path(@quiz)

    fill_in "Title", with: ""
    click_button "UPDATE QUIZ"

    expect(page).to have_content("Title can't be blank")
  end
end
