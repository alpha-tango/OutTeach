require 'rails_helper'

feature 'users views courses' do
  before(:each) do
    @courses = FactoryGirl.create_list(:course, 3)
  end
  scenario 'user views a list of courses' do
    visit courses_path

    @courses.each do |course|
      expect(page).to have_content(course.title)
      expect(page).to have_content(course.subject)
      expect(page).to have_content(course.description)
    end
  end
end
