require 'rails_helper'

feature 'add a new assignment' do

  before(:each) do
    @course = FactoryGirl.create(:course)
  end

  scenario 'add a valid assignment' do
    visit course_path(@course)

    fill_in "Title", with: "Assignment1"

    click_button "Create Assignment"

    expect(page).to have_content("successfully")
    expect(page).to have_content(@course.title)
    expect(page).to have_content("Assignment1")
  end

  scenario 'add a blank assignment'
end
