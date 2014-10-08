require 'rails_helper'

feature 'add a new assignment' do

  before(:each) do
    @course = FactoryGirl.create(:course)
    sign_in_as(@course.user)
  end

  scenario 'add a valid assignment' do
    assignment = FactoryGirl.create(:assignment)
    visit course_path(@course)

    fill_in "Title", with: assignment.title

    click_button "Create Assignment"

    expect(page).to have_content("successfully")
    expect(page).to have_content(@course.title)
    expect(page).to have_content(assignment.title)
  end

  scenario 'add a blank assignment' do
    visit course_path(@course)

    click_button "Create Assignment"

    expect(page).to have_content("Title can't be blank")
  end
end
