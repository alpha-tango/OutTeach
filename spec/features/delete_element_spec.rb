require "rails_helper"

feature 'user deletes an element', focus: true do
  scenario 'delete element' do
    element = FactoryGirl.create(:element)
    sign_in_as(element.assignment.course.user)
    visit course_assignment_path(element.assignment.course, element.assignment)

    click_link "Element"

    expect(page).to have_content("Element deleted")
    expect(page).to_not have_content(element.title)
  end
end
