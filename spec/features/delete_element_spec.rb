require "rails_helper"

feature 'user deletes an element' do
  scenario 'delete element' do
    element = FactoryGirl.create(:text_element)
    sign_in_as(element.assignment.course.user)
    visit assignment_path(element.assignment)

    click_link "Delete Element"

    expect(page).to have_content("Element deleted")
    expect(page).to_not have_content(element.title)
    expect(page).to_not have_content(element.content)
  end
end
