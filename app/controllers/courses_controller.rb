class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

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
