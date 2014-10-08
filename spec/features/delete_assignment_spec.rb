require "rails_helper"

feature 'user deletes an assignment', focus: true do
  scenario 'delete course' do
    assignment = FactoryGirl.create(:assignment)
    sign_in_as(assignment.course.user)
    visit course_assignment_path(assignment.course, assignment)

    click_link "Delete Assignment"

    expect(page).to have_content("successfully")
    expect(page).to_not have_content(assignment.title)
  end
end
