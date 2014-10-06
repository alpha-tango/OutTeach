require "rails_helper"

feature 'add a new course', focus: true do
  scenario 'add a valid course' do
    visit new_course_path

    fill_in "Title", with: "Test1"
    fill_in "Subject", with: "Javawebs"
    fill_in "Description", with: "Teaches all the webs"

    click_button "Create Course"

    expect(page).to have_content("successfully")
    expect(page).to have_content("Test1")
    expect(page).to have_content("Javawebs")
    expect(page).to have_content("Teaches all the webs")
  end

  scenario 'add a blank course' do
    visit new_course_path

    click_button "Create Course"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Subject can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
