module Helpers
  module Authentication
    def sign_in_as(user)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "LOG IN"
    end

    def admin_sign_in
      @user = FactoryGirl.create(:user)
      @admin = FactoryGirl.create(:user, role: 'admin')
      sign_in_as(@admin)
      @course = FactoryGirl.create(:course, user: @user)
    end
  end
end
