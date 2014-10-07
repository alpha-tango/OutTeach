class HomeController < ApplicationController
  def index
    @courses = Course.order(created_at: :desc).limit(10)
  end
end
