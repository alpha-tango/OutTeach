require "rails_helper"

feature 'user updates a course' do
  scenario 'add a valid course' do
    course = FactoryGirl.create(:course)
    sign_in_as(course.user)
    visit edit_course_path(course)

    fill_in "Title", with: "new title"
    fill_in "Subject", with: "new subject"
    fill_in "Description", with: "new description"

    click_button "Update Course"

    expect(page).to have_content("changes have been saved")
    expect(page).to have_content("new title".upcase)
    expect(page).to have_content("new subject".upcase)
    expect(page).to have_content("new description")
  end

  scenario 'add blank edits to course' do
    course = FactoryGirl.create(:course)
    sign_in_as(course.user)
    visit edit_course_path(course)

    fill_in "Title", with: ""
    fill_in "Subject", with: ""
    fill_in "Description", with: ""

    click_button "Update Course"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Subject can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
