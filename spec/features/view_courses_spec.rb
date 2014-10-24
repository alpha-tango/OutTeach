require 'rails_helper'

feature 'users views courses' do
  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    @course = FactoryGirl.create(:course)
    @enrollments = FactoryGirl.create_list(:enrollment, 3, course: @course)
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

  scenario 'user views course details' do
    visit course_path(@course)

    expect(page).to have_content(@course.title)
    expect(page).to have_content(@course.subject)
    expect(page).to have_content(@course.description)
    expect(page).to have_content(@course.created_at.strftime("%b %d, %Y"))

    @course.enrollments.each do |enrollment|
      expect(page).to have_content(enrollment.user.name)
    end
  end
end
