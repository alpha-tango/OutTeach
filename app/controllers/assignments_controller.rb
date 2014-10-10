class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @assignment = Assignment.new(assignment_params)
    @course = Course.find(params[:course_id])
    @assignment.course = @course

    if @assignment.save
      flash[:notice] = "Assignment successfully created!"
      redirect_to course_assignment_path(@course, @assignment)
    else
      render :show
    end
  end

  def assignment_params
    params.require(:assignment).permit(:course_id, :title)
  end

  def show
    @assignment = Assignment.find(params[:id])
    @element = Element.new
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    if @assignment.course.user == current_user && @assignment.destroy
      redirect_to course_path(@assignment.course)
      flash[:notice] = "Assignment deleted"
    else
      render :show
    end
  end

  def edit
    assignment = Assignment.find(params[:id])
    if assignment.course.user == current_user
      @assignment = assignment
    end
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.course.user == current_user && @assignment.update(assignment_params)
      redirect_to course_assignment_path(@assignment.course, @assignment)
      flash[:notice] = "Assignment updated"
    else
      render :edit
    end
  end
end
