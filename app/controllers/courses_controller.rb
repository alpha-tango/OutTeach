class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.includes(:user).all
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

  def destroy
    @course = Course.authorized_find(current_user, params[:id])
    if @course.destroy
      redirect_to courses_path
      flash[:notice] = "You've successfully deleted this course."
    else
      render :show
      flash[:alert] = "Error! Course was not deleted."
    end
  end

  def edit
    @course = Course.authorized_find(current_user, params[:id])
  end

  def update
    @course = Course.authorized_find(current_user, params[:id])

    if @course.update(course_params)
      redirect_to course_path(@course)
      flash[:notice] = "Your changes have been saved."
    else
      render :edit
    end
  end

  def course_params
    params.require(:course).permit(:title, :description, :subject)
  end

  def show
    @course = Course.includes(:assignments, :enrollments, :quizzes, :user).find(params[:id])
    @assignment = Assignment.new
    @quiz = Quiz.new
  end
end
