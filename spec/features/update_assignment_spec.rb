require 'rails_helper'

feature 'update an assignment' do

  before(:each) do
    @assignment = FactoryGirl.create(:assignment)
    sign_in_as(@assignment.course.user)
  end

  scenario 'update assignment' do
    visit course_assignment_path(@assignment.course, @assignment)

    fill_in "New Title", with: @assignment.title

    click_button "Update Assignment"

    expect(page).to have_content("updated")
    expect(page).to have_content("New Title")
  end
end
