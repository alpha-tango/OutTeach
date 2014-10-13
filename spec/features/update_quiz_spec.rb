require 'rails_helper'

feature 'update a quiz', focus: true do

  before(:each) do
    @quiz = FactoryGirl.create(:assignment)
    sign_in_as(@quiz.user)
  end

  scenario 'update quiz with valid information' do
    visit edit_quiz_path(@quiz)

    fill_in "Title", with: "New  Quiz Title"

    click_button "UPDATE QUIZ"

    expect(page).to have_content("updated")
    expect(page).to have_content("New Quiz Title")
  end
end
