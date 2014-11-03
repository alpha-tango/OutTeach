require 'rails_helper'

feature 'add a new quiz', js: true do

  before(:each) do
    @course = FactoryGirl.create(:course)
    sign_in_as(@course.user)
  end

  scenario 'add a valid quiz' do
    quiz = FactoryGirl.build(:quiz)
    visit course_path(@course)
    click_link "+ add a new quiz"

    within 'div.new-quiz' do
      fill_in "Title", with: quiz.title
      click_button "CREATE QUIZ"
    end

    expect(page).to have_content("successfully")
    expect(page).to have_content(@course.title.upcase)
    expect(page).to have_content(quiz.title)
  end

  scenario 'add a blank quiz' do
    visit course_path(@course)
    click_link "+ add a new quiz"

    within 'div.new-quiz' do
      click_button "CREATE QUIZ"
    end
      expect(page).to have_content("Title can't be blank")
  end
end
