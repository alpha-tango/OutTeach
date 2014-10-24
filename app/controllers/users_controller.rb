class UsersController < ApplicationController
  def show
    @user = User.includes(:courses).find(params[:id])
    @enrollments = Enrollment.includes(:course).where(user_id: @user.id)
  end
end
