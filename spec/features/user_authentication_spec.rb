require 'rails_helper'

feature 'guest registration' do
  scenario 'fill in registration form' do
    user = FactoryGirl.build(:user)
    visit "/users/sign_up"

    fill_in "Email" , with: user.email
    fill_in "user_name", with: user.name
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button "SIGN UP"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end

feature 'user login' do
  scenario 'login' do
    user = FactoryGirl.create(:user)
    visit "/users/sign_in"

    fill_in "Email" , with: user.email
    fill_in "Password", with: user.password
    click_button "LOG IN"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Logout")
  end
end
