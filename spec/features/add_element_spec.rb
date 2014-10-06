require 'rails_helper'

feature 'add a new element' do

  before(:each) do
    @assignment = FactoryGirl.create(:assignment)
  end

  scenario 'add a valid text element' do
    visit course_assignment_path(@assignment.course, @assignment)

    fill_in "Title", with: "Workshop"
    select "Text", from: "element_type_id"
    fill_in "Content", with: %Q{ During this three-hour workshop, we’ll begin by reviewing the foundation of a responsive design—from fluid grids, to flexible images, to media queries—before moving into the finer points of designing responsively. We’ll discuss what it means to design for 'mobile first,'' and how we can collaborate with others in a responsive-friendly design workflow. We’ll also talk about performance—how we ensure our sites are as fast as they are flexible. }
    fill_in "Citation", with: "The most badass source"
    click_button "Create Element"

    expect(page).to have_content("During this three-hour workshop, we’ll begin by reviewing the foundation of a responsive design—from fluid grids, to flexible images, to media queries—before moving into the finer points of designing responsively. We’ll discuss what it means to design for “mobile first,” and how we can collaborate with others in a responsive-friendly design workflow. We’ll also talk about performance—how we ensure our sites are as fast as they are flexible.")
    expect(page).to have_content("The most badass source")
    expect(page).to have_content("Workshop")
  end

  scenario 'add a blank element'

end
