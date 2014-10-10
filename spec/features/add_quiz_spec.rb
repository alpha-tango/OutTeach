require 'rails_helper'

feature 'add a new quiz' do

  before(:each) do
    @course = FactoryGirl.create(:course)
    sign_in_as(@course.user)
  end

  scenario 'add a valid quiz' do
    quiz = FactoryGirl.build(:quiz)
    visit course_path(@course)

    within 'div#new-quiz' do
      fill_in "Title", with: quiz.title
      click_button "Create Quiz"
    end

    expect(page).to have_content("successfully")
    expect(page).to have_content(@course.title)
    expect(page).to have_content(quiz.title)
  end

  scenario 'add a blank quiz' do
    visit course_path(@course)

    within 'div#new-quiz' do
      click_button "Create Quiz"
      expect(page).to have_content("Title can't be blank")
    end
  end
end
