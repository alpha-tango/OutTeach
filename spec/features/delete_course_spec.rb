require "rails_helper"

feature 'user deletes a course' do
  scenario 'add a valid course' do
    course = FactoryGirl.create(:course)
    sign_in_as(course.user)
    visit course_path(course)

    click_link "Delete Course"

    expect(page).to have_content("successfully")
    expect(page).to_not have_content(course.title)
    expect(page).to_not have_content(course.title)
    expect(page).to_not have_content(course.description)
  end
end
