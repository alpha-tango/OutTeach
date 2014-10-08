require "rails_helper"

feature 'add a new course' do
  scenario 'add a valid course' do
    course = FactoryGirl.build(:course)
    visit new_course_path

    fill_in "Title", with: course.title
    fill_in "Subject", with: course.subject
    fill_in "Description", with: course.description

    click_button "Create Course"

    expect(page).to have_content("successfully")
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.description)
  end

  scenario 'add a blank course' do
    visit new_course_path

    click_button "Create Course"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Subject can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
