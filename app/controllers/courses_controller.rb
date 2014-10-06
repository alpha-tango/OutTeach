class CoursesController < ApplicationController
  def new
    @courses = Course.new
  end
end
