require 'rails_helper'

feature 'add a new element' do

  before(:each) do
    @assignment = FactoryGirl.create(:assignment)
  end

  scenario 'add a valid text element' do
    visit course_assignment_path(@assignment.course, @assignment)

    fill_in "Title", with: "Workshop"
    select "Text", from: "element_type_id"
    fill_in "Content", with: "During this three-hour workshop"
    fill_in "Citation", with: "The most badass source"
    click_button "Create Element"

    within('div.text') do
      expect(page).to have_content("During this three-hour workshop")
      expect(page).to have_content("The most badass source")
      expect(page).to have_content("Workshop")
    end
  end

  scenario 'add a valid tipbox element' do
    visit course_assignment_path(@assignment.course, @assignment)

    fill_in "Title", with: "Tipbox Title"
    select "Tipbox", from: "element_type_id"
    fill_in "Content", with: "This is a definition"
    fill_in "Citation", with: "The most badass source"
    click_button "Create Element"

    within('div.tipbox') do
      expect(page).to have_content("definition")
      expect(page).to have_content("The most badass source")
      expect(page).to have_content("Tipbox Title")
    end
  end

  scenario 'add a valid image element' do
    visit course_assignment_path(@assignment.course, @assignment)

    fill_in "Title", with: "Picture Title"
    select "Image", from: "element_type_id"
    fill_in "Url", with: "http://example.jpg"
    fill_in "Citation", with: "The most badass source"
    click_button "Create Element"

    within('div.image') do
      expect(page).to have_css("img[src=\"http://example.jpg\"]")
      expect(page).to have_content("The most badass source")
      expect(page).to have_content("Picture Title")
    end
  end

  scenario 'add a valid video element' do
    visit course_assignment_path(@assignment.course, @assignment)

    fill_in "Title", with: "Video Title"
    select "Video", from: "element_type_id"
    fill_in "Url", with: "http://example.jpg"
    fill_in "Citation", with: "The most badass source"
    click_button "Create Element"

    within('div.video') do
      expect(page).to have_css("iframe[src=\"http://example.jpg\"]")
      expect(page).to have_content("The most badass source")
      expect(page).to have_content("Video Title")
    end
  end

  scenario 'add a blank element' do
    visit course_assignment_path(@assignment.course, @assignment)

    click_button "Create Element"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Citation can't be blank")
  end
end
