require 'rails_helper'

feature 'add a new element' do

  before(:each) do
    @assignment = FactoryGirl.create(:assignment)
    sign_in_as (@assignment.user)
  end

  scenario 'add a valid text element' do
    element = FactoryGirl.build(:text_element)
    visit assignment_path(@assignment)

    fill_in "Title", with: element.title
    select "Text", from: "element_type_id"
    fill_in "Content", with: element.content
    fill_in "Citation", with: element.citation
    click_button "SAVE CONTENT"

    within('div.text') do
      expect(page).to have_content(element.title)
      expect(page).to have_content(element.content)
      expect(page).to have_content(element.citation)
    end
  end

  scenario 'add a valid tipbox element' do
    element = FactoryGirl.build(:tipbox_element)
    visit assignment_path(@assignment)

    fill_in "Title", with: element.title
    select "Tipbox", from: "element_type_id"
    fill_in "Content", with: element.content
    fill_in "Citation", with: element.citation
    click_button "SAVE CONTENT"

    within('div.tipbox') do
      expect(page).to have_content(element.title)
      expect(page).to have_content(element.content)
      expect(page).to have_content(element.citation)
    end
  end

  scenario 'add a valid image element' do
    element = FactoryGirl.build(:image_element)
    visit assignment_path(@assignment)

    fill_in "Title", with: element.title
    select "Image", from: "element_type_id"
    fill_in "Url", with: element.url
    fill_in "Citation", with: element.citation
    click_button "SAVE CONTENT"

    within('div.image') do
      expect(page).to have_css("img[src=\"#{element.url}\"]")
      expect(page).to have_content(element.title)
      expect(page).to have_content(element.citation)
    end
  end

  scenario 'add a valid video element' do
    element = FactoryGirl.build(:video_element)
    visit assignment_path(@assignment)

    fill_in "Title", with: element.title
    select "Video", from: "element_type_id"
    fill_in "Video embed", with: element.url
    fill_in "Citation", with: element.citation
    click_button "SAVE CONTENT"

    within('div.video') do
      expect(page).to have_css('iframe')
      expect(page).to have_content(element.title)
      expect(page).to have_content(element.citation)
    end
  end

  scenario 'add a valid markdown element' do
    element = FactoryGirl.build(:markdown_element)
    visit assignment_path(@assignment)

    fill_in "Title", with: element.title
    select "Markdown", from: "element_type_id"
    fill_in "Content", with: element.content
    fill_in "Citation", with: element.citation
    click_button "SAVE CONTENT"

    within('div.markdown') do
      expect(page).to have_content(element.title)
      expect(page).to have_content(element.citation)
      expect(page).to have_css("code")
    end
  end

  scenario 'add a blank element' do
    visit assignment_path(@assignment)

    click_button "SAVE CONTENT"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Citation can't be blank")
  end
end
