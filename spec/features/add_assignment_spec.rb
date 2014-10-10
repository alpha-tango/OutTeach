require 'rails_helper'

feature 'add a new assignment' do

  before(:each) do
    @course = FactoryGirl.create(:course)
    sign_in_as(@course.user)
  end

  scenario 'add a valid assignment' do
    visit new_course_assignment_path(@course)
    assignment = FactoryGirl.build(:assignment, course: @course)

    fill_in "Title", with: assignment.title
    fill_in "Why This Is Important", with: assignment.importance
    fill_in "Learning Goals", with: assignment.goals
    click_button "Create Assignment"

    expect(page).to have_content("successfully")
    expect(page).to have_content(@course.title)
    expect(page).to have_content(assignment.title)
  end

  scenario 'add a blank assignment' do
    visit new_course_assignment_path(@course)

    click_button "Create Assignment"
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Importance can't be blank")
    expect(page).to have_content("Goals can't be blank")
  end
end
