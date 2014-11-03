require 'rails_helper'

feature 'add a new assignment', js: true do

  before(:each) do
    @course = FactoryGirl.create(:course)
    sign_in_as(@course.user)
  end

  scenario 'add a valid assignment' do
    visit course_path(@course)
    assignment = FactoryGirl.build(:assignment, course: @course)

    click_link "+ add a new assignment"

    within 'div.new-assignment' do
      fill_in "Title", with: assignment.title
      fill_in "Why This Is Important", with: assignment.importance
      fill_in "Learning Goals", with: assignment.goals
      click_button "CREATE ASSIGNMENT"
    end

    expect(page).to have_content("successfully")
    expect(page).to have_content(@course.title.upcase)
    expect(page).to have_content(assignment.title)
  end

  scenario 'add a blank assignment' do
    visit course_path(@course)
    click_link "+ add a new assignment"

    within 'div.new-assignment' do
      click_button "CREATE ASSIGNMENT"
    end
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Importance can't be blank")
      expect(page).to have_content("Goals can't be blank")
  end
end
