class Admin::UsersController < ApplicationController
  before_filter :authorize!

  def index
    @members = User.where(role: 'member')
    @admins = User.where(role: 'admin')
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "User deleted"
    else
      flash[:alert] = "An error occurred. Please try again later."
    end

    redirect_to admin_users_path
  end
end
