require 'rails_helper'

feature 'update an assignment' do

  before(:each) do
    @assignment = FactoryGirl.create(:assignment)
    sign_in_as(@assignment.user)
  end

  scenario 'update assignment' do
    visit edit_assignment_path(@assignment)

    fill_in "Title", with: "New Title"

    click_button "Update Assignment"

    expect(page).to have_content("updated")
    expect(page).to have_content("New Title")
  end
end
