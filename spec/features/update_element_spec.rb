require 'rails_helper'

feature 'update element', focus: true do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in_as (user)
    course = FactoryGirl.create(:course, user: user)
    @assignment = FactoryGirl.create(:assignment, course: course)
  end

  scenario 'update a valid text element' do
    element = FactoryGirl.create(:text_element, assignment: @assignment)
    visit edit_element_path(element)

    fill_in "Title", with: "New Title"
    select "Markdown", from: "element_type_id"
    click_button "Create Element"

    expect(page).to have_content("updated")
    within('div.markdown') do
      expect(page).to have_content("New Title")
      expect(page).to have_css("code")
      expect(page).to have_content(element.citation)
    end
  end
end
