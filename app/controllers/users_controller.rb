class UsersController < ApplicationController
  def show
    @user = User.includes(:courses).find(params[:id])
  end
end
