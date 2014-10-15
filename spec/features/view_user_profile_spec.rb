require 'rails_helper'

feature 'view a user profile do' do
  scenario 'view profile' do
    user = FactoryGirl.create(:user)
    @courses = FactoryGirl.create_list(:course, 3, user: user)
    sign_in_as(user)

    visit user_path(user)

    expect(page).to have_content(user.name.upcase)
    expect(page).to have_content(user.created_at.strftime("%b %d, %Y"))

    @courses.each do |course|
      expect(page).to have_content(course.title)
    end
  end
end
