require "rails_helper"

feature 'user deletes an assignment' do
  scenario 'delete course' do
    assignment = FactoryGirl.create(:assignment)
    sign_in_as(assignment.user)
    visit assignment_path(assignment)

    click_link "Delete Assignment"

    expect(page).to have_content("Assignment deleted")
    expect(page).to_not have_content(assignment.title)
  end
end
