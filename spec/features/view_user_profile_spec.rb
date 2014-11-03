require 'rails_helper'

feature 'view a user profile do' do
  scenario 'view profile' do
    user = FactoryGirl.create(:user)
    @courses = FactoryGirl.create_list(:course, 3, user: user)
    enrolled_course = FactoryGirl.create(:course)
    enrollment = FactoryGirl.create(:enrollment,
                                    user: user,
                                    course: enrolled_course)
    sign_in_as(user)

    visit user_path(user)

    expect(page).to have_content(user.name.upcase)
    expect(page).to have_content(user.created_at.strftime("%b %d, %Y"))
    expect(page).to have_content(enrolled_course.title)

    @courses.each do |course|
      expect(page).to have_content(course.title)
    end
  end
end
