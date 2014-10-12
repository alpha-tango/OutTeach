require 'rails_helper'

feature 'admin can manage users' do
  before :each do
    admin_sign_in
  end

  scenario 'admin visits users index' do
    visit '/admin/users'
    expect(page).to have_content(@user.email)
  end

  scenario 'admin deletes user' do
    visit '/admin/users'
    click_link "Permanently remove this user"
    expect(page).to have_content("User deleted")
  end
end

feature 'admin can manage content' do
  before :each do
    admin_sign_in
  end

  scenario 'admin deletes inappropriate course' do
  end
end
