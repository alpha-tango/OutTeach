class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user

    if @course.save
      flash[:notice] = "You've successfully created a new course!"
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def course_params
    params.require(:course).permit(:title, :description, :subject)
  end

  def show
    @course = Course.find(params[:id])
    @assignment = Assignment.new
  end
end
